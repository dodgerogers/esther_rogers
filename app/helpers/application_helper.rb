module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render partial: "attachments/fields_for", locals: { f: builder }
    end
    link_to name, "#", class: "add_fields btn btn-primary", data: {id: id, fields: fields.gsub!("\n", "")}
  end
  
  def meta_title(title=nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? content_for(:title) + " | " + META_CONFIG['title'] : META_CONFIG['title']
    end
  end
  
  def meta_keywords(tags=nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? [content_for(:meta_keywords), META_CONFIG["keywords"]].join(", ") : META_CONFIG["keywords"]
    end
  end
  
  def meta_description(desc=nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : META_CONFIG["description"]
    end
  end
end
