class Search < ActiveRecord::Base
  extend Textacular

  belongs_to :searchable, polymorphic: true

  def initialize(query)
    @query = query
  end

  def results
    if @query.present?
      carry_on_with_serach(@query)
    else
      Search.none
    end
  end

  private

  def carry_on_with_serach(query)
    self.class.
      search(query).preload(:searchable).
      map(&:searchable).uniq
  end
end
