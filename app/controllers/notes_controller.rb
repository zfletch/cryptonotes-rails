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

    if @note&.view_count
      @note.update!(view_count: @note.view_count - 1)

      if @note.view_count == 0
        @note.destroy
      end
    end
  end

  private

  def note_params
    return @note_params if @note_params

    @note_params = params.require(:note).permit(:text)

    if params.delete(:delete_on_view)
      @note_params[:view_count] = 2
    end

    @note_params
  end
end
