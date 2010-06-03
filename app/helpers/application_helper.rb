# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 def checklist(name, collection, value_method, display_method, selected)
    selected ||= []

    ERB.new(%{
    <div class="checklist" style="border:1px solid #666; width:20em; height:5em; overflow:auto">
      <% for item in collection %>
        <%= check_box_tag name, item.send(value_method), selected.include?(item.send(value_method)) %> <%=h item.send(display_method) %><br />
      <% end %>
    </div>}).result(binding)
  end
def file_field_for(form, field)
 label = content_tag("label", "#{field.humanize}:", :for => field)
form_field = form.file_field field,
content_tag("div", "#{label} #{form_field}", :class => "form_row")
end
def text_field_for(form, field,
size=HTML_TEXT_FIELD_SIZE,
maxlength=DB_STRING_MAX_LENGTH)
label = content_tag("label", "#{field.humanize}:", :for => field)
form_field = form.text_field field, :size => size, :maxlength => maxlength
content_tag("div", "#{label} #{form_field}", :class => "form_row")
end


def nav_link(text, controller, action="index")
link_to_unless_current text, :id => nil,
:action => action,
:controller => controller
end

def profile_for(user)
    profile_url(:login => user.login)
end

  # Return true if hiding the edit links for spec, FAQ, etc.
  def hide_edit_links?
    not @hide_edit_links.nil?
  end

def paginated?
    @pages and @pages.length > 1
  end
end
