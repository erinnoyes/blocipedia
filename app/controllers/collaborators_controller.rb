class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    user = User.find_by(email: params[:collaborator][:email])
    @collaborator = Collaborator.new(wiki: @wiki, user: user)

    if @collaborator.save
      flash[:notice] = "Collaborator added."
    else
      flash[:alert] = "There was an error. Collaborator not added"
    end
      redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = @wiki.collaborators.find(params[:id])

    if collaborator.destroy
      flash[:notice] = "Collaborator removed."
    else
      flash[:alert] = "There was an error. Collaborator not removed."
    end
      redirect_to edit_wiki_path(@wiki)
  end

end
