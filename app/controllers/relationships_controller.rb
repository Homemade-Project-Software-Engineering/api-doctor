class RelationshipsController < ApplicationController
  respond_to :json, :html

  def destroy
    @r = Relationship.find_by(caregiver_id:relationship_params[:caregiver_id],patient_id:relationship_params[:patient_id])
    respond_with(@r) do |format|
      if @r.destroy
        format.html { render nothing: true, status: :unauthorized }
        format.json { head :no_content }
      end
    end

  end

  # POST /relationships
  # POST /relationships.json
  def create

    @user = User.find(relationship_params[:caregiver_id])
    @user.cuidar(relationship_params[:patient_id])
    render json: {notice:"ok"}
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.fetch(:relationship, {}).permit(:caregiver_id,:patient_id)
    end
end
