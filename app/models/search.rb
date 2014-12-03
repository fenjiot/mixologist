class Search < ActiveRecord::Base
  extend Textacular

  belongs_to :searchable, polymorphic: true

  def initialize(query)
    @query = query
  end

  def results
    if @query.present?
      result = execute_search(@query).group_by(&:class)
      result.sort_by { |key, _group| key.to_s }
    else
      Search.none
    end
  end

  private

  def execute_search(query)
    self.class.
      search(query).preload(:searchable).
      map(&:searchable).uniq
  end
end
