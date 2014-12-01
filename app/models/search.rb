class Search < ActiveRecord::Base
  extend Textacular

  belongs_to :searchable, polymorphic: true

  def initialize(query)
    @query = query
  end

  def results
    if @query.present?
      carry_on_with_serach
    else
      Search.none
    end
  end

  private

  def carry_on_with_serach
    result = self.class.
      search(@query).preload(:searchable).
      map(&:searchable).uniq
    answer(result)
  end

  def answer(result)
    if result.present?
      result
    else
      return "No references to #{@query} were found"
    end
  end
end
