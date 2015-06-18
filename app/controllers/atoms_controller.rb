class AtomsController < ApplicationController
  def index
    @atoms = current_account.atoms.preload(:properties => :field).order("created_at desc")

    respond_to do |format|
      format.html {}
      format.json do
        render json: AtomsSerializer.new(@atoms).to_json
      end
    end
  end

  def show
    @atom = current_account.atoms.find_by!(number: params[:id])

    respond_to do |format|
      format.html {}
      format.json do
        render json: AtomSerializer.new(@atom).to_json
      end
    end
  end

  def create
    populate(nil)
  end

  def update
    atom = current_account.atoms.find_by!(number: params[:id])
    populate(atom)
  end

  protected

  def populate(atom)
    creator = PopulateAtom.new(atom, params.require(:atom), user: user)
    if creator.call
      respond_to do |format|
        format.html { redirect_to creator.atom }
        format.json do
          render json: AtomSerializer.new(creator.atom).to_json
        end
      end
    else
      respond_to do |format|
        format.html { render text: creator.errors.full_messages.to_sentence }
        format.json do
          render json: {errors: errors.full_messages}
        end
      end
    end
  end
end
