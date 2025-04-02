require "test_helper"

class AuditLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audit_log = audit_logs(:one)
  end

  test "should get index" do
    get audit_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_audit_log_url
    assert_response :success
  end

  test "should create audit_log" do
    assert_difference("AuditLog.count") do
      post audit_logs_url, params: { audit_log: { action: @audit_log.action, associated_id: @audit_log.associated_id, associated_type: @audit_log.associated_type, auditable_id: @audit_log.auditable_id, auditable_type: @audit_log.auditable_type, audited_changes: @audit_log.audited_changes, comment: @audit_log.comment, created_at: @audit_log.created_at, remote_address: @audit_log.remote_address, request_uuid: @audit_log.request_uuid, user_id: @audit_log.user_id, user_type: @audit_log.user_type, username: @audit_log.username, version: @audit_log.version } }
    end

    assert_redirected_to audit_log_url(AuditLog.last)
  end

  test "should show audit_log" do
    get audit_log_url(@audit_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_audit_log_url(@audit_log)
    assert_response :success
  end

  test "should update audit_log" do
    patch audit_log_url(@audit_log), params: { audit_log: { action: @audit_log.action, associated_id: @audit_log.associated_id, associated_type: @audit_log.associated_type, auditable_id: @audit_log.auditable_id, auditable_type: @audit_log.auditable_type, audited_changes: @audit_log.audited_changes, comment: @audit_log.comment, created_at: @audit_log.created_at, remote_address: @audit_log.remote_address, request_uuid: @audit_log.request_uuid, user_id: @audit_log.user_id, user_type: @audit_log.user_type, username: @audit_log.username, version: @audit_log.version } }
    assert_redirected_to audit_log_url(@audit_log)
  end

  test "should destroy audit_log" do
    assert_difference("AuditLog.count", -1) do
      delete audit_log_url(@audit_log)
    end

    assert_redirected_to audit_logs_url
  end
end
