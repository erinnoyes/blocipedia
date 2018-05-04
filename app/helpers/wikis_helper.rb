module WikisHelper

  def users_wiki_is_private(wiki)
    current_user && (current_user.admin? || current_user.premium?)
  end

  def wiki_is_public(wiki)
    !wiki.private?
  end
end
