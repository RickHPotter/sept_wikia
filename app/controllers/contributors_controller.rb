class ContributorsController < ApplicationController
  before_action :set_contributor, only: %i[show edit update destroy]

  # GET /contributors or /contributors.json
  def index
    date = Date.today.in_time_zone('America/Sao_Paulo')
    @contributors = Contributor.where(created_at: date.all_day)
  end

  # GET /contributors/1 or /contributors/1.json
  def show = nil

  # GET /contributors/new
  def new
    @contributor = Contributor.new
  end

  # GET /contributors/1/edit
  def edit = nil

  # POST /contributors or /contributors.json
  def create
    @contributor = Contributor.new(contributor_params)
    respond_to_save(
      @contributor.save,
      "#{@contributor.name} was successfully created."
    )
  end

  # PATCH/PUT /contributors/1 or /contributors/1.json
  def update
    respond_to_save(
      @contributor.update(contributor_params),
      "#{@contributor.name} was successfully updated."
    )
  end

  # DELETE /contributors/1 or /contributors/1.json
  def destroy
    @contributor.destroy
    respond_to do |format|
      format.html do
        redirect_to contributors_url,
                    notice: "#{@contributor.name} was successfully destroyed."
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contributor
    @contributor = Contributor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contributor_params
    params.require(:contributor).permit(
      :name,
      :email,
      :role,
      :intro
    )
  end

  def respond_to_save(func, notice)
    respond_to do |format|
      if func
        format.html { redirect_to contributor_url(@contributor), notice: notice.to_s }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
