<%- module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
  audited
   <%- attributes.reject(&:password_digest?).each do |attribute| -%>
        <%- if attribute.type.to_s == "references" -%>
  belongs_to :<%= attribute.name %>
        <%- end -%>
  <%- end -%>
  # validate if attribute name is present
  def name
    self.id
  end
  def self.ransackable_attributes(auth_object = nil)
    %w[<%= attributes.reject { |attr| attr.password_digest? || attr.reference? }.map(&:name).join(" ") %> <%= attributes.select(&:reference?).map{|attr| attr.name+'_id'}.join(" ") %>]
  end
  <%- if attributes.any?(&:reference?) -%>
  def self.ransackable_associations(auth_object = nil)
    %w[<%= attributes.select(&:reference?).map(&:name).join(" ") %>]
  end
  <%- end -%>
end
<%- end -%>