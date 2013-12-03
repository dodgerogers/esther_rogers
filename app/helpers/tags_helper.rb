module TagsHelper
  def display_tags(objects)
    raw objects.map(&:name).map.each { |t| link_to t, category_path(t), class: current(category_path(t)) }.join(" ")
  end
end