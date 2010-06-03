module HomeHelper

   # Return the user's profile URL.
  def profile_for(user)
    profile_url(:login => user.login)
  end

  # Return true if hiding the edit links for spec, FAQ, etc.
  def hide_edit_links?
    not @hide_edit_links.nil?
  end

end
