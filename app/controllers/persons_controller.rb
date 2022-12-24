class PersonsController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /persons
  def index
    @persons = Person.all
  end

  # GET /persons/1
  def show
    @comment = Comment.new
  end

  # GET /persons/new
  def new
    @person = Person.new
  end

  # GET /persons/1/edit
  def edit
  end

  # POST /persons
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, success: t("crud.controller.success.created", name: @person.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /persons/1
  def update
    if @person.update(person_params)
      redirect_to @person, success: t("crud.controller.success.edited", name: @person.name)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /persons/1
  def destroy
    @person.destroy
    redirect_to persons_url, danger: t("crud.controller.success.deleted", name: @person.name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:title, :firstname, :lastname, :gender, :birthday, :profession)
    end
end
