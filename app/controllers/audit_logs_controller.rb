class AuditLogsController < ApplicationController
  before_action :set_audit_log, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 

  # GET /audit_logs or /audit_logs.json
  def index
    @audit_logs = AuditLog.all
  end

  # GET /audit_logs/1 or /audit_logs/1.json
  def show
  end

  # GET /audit_logs/new
  def new
    @audit_log = AuditLog.new
  end

  # GET /audit_logs/1/edit
  def edit
  end

  # POST /audit_logs or /audit_logs.json
  def create
    @audit_log = AuditLog.new(audit_log_params)

    respond_to do |format|
      if @audit_log.save
        flash[:success] = '¡Registro creado exitosamente!'
        format.html { redirect_to @audit_log, notice: "Audit log was successfully created." }
        format.json { render :show, status: :created, location: @audit_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @audit_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audit_logs/1 or /audit_logs/1.json
  def update
    respond_to do |format|
      if @audit_log.update(audit_log_params)
        flash[:success] = '¡Registro modificado exitosamente!'
        format.html { redirect_to @audit_log, notice: "Audit log was successfully updated." }
        format.json { render :show, status: :ok, location: @audit_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @audit_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audit_logs/1 or /audit_logs/1.json
  def destroy
    @audit_log.destroy!
    flash[:success] = '¡Registro eliminado exitosamente!'
    respond_to do |format|
      format.html { redirect_to audit_logs_path, status: :see_other, notice: "Audit log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit_log
      @audit_log = AuditLog.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = '¡Registro no encontrado!'
      redirect_to posts_url, notice: 'Audit Logs no encontrado '
    end

    # Only allow a list of trusted parameters through.
    def audit_log_params
      params.require(:audit_log).permit(:auditable_id, :auditable_type, :associated_id, :associated_type, :user_id, :user_type, :username, :action, :audited_changes, :version, :comment, :remote_address, :request_uuid, :created_at)
    end
end
