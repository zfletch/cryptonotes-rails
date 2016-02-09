class NotesController < ApplicationController
  def search
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to action: :show, id: @note.reload.uuid
    else
      render :new
    end
  end

  def show
    @note = Note.find_by(uuid: params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:text)
  end
end
