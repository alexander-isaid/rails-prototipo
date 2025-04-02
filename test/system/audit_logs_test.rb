require "application_system_test_case"

class AuditLogsTest < ApplicationSystemTestCase
  setup do
    @audit_log = audit_logs(:one)
  end

  test "visiting the index" do
    visit audit_logs_url
    assert_selector "h1", text: "Audit logs"
  end

  test "should create audit log" do
    visit audit_logs_url
    click_on "New audit log"

    fill_in "Action", with: @audit_log.action
    fill_in "Associated", with: @audit_log.associated_id
    fill_in "Associated type", with: @audit_log.associated_type
    fill_in "Auditable", with: @audit_log.auditable_id
    fill_in "Auditable type", with: @audit_log.auditable_type
    fill_in "Audited changes", with: @audit_log.audited_changes
    fill_in "Comment", with: @audit_log.comment
    fill_in "Created at", with: @audit_log.created_at
    fill_in "Remote address", with: @audit_log.remote_address
    fill_in "Request uuid", with: @audit_log.request_uuid
    fill_in "User", with: @audit_log.user_id
    fill_in "User type", with: @audit_log.user_type
    fill_in "Username", with: @audit_log.username
    fill_in "Version", with: @audit_log.version
    click_on "Create Audit log"

    assert_text "Audit log was successfully created"
    click_on "Back"
  end

  test "should update Audit log" do
    visit audit_log_url(@audit_log)
    click_on "Edit this audit log", match: :first

    fill_in "Action", with: @audit_log.action
    fill_in "Associated", with: @audit_log.associated_id
    fill_in "Associated type", with: @audit_log.associated_type
    fill_in "Auditable", with: @audit_log.auditable_id
    fill_in "Auditable type", with: @audit_log.auditable_type
    fill_in "Audited changes", with: @audit_log.audited_changes
    fill_in "Comment", with: @audit_log.comment
    fill_in "Created at", with: @audit_log.created_at
    fill_in "Remote address", with: @audit_log.remote_address
    fill_in "Request uuid", with: @audit_log.request_uuid
    fill_in "User", with: @audit_log.user_id
    fill_in "User type", with: @audit_log.user_type
    fill_in "Username", with: @audit_log.username
    fill_in "Version", with: @audit_log.version
    click_on "Update Audit log"

    assert_text "Audit log was successfully updated"
    click_on "Back"
  end

  test "should destroy Audit log" do
    visit audit_log_url(@audit_log)
    click_on "Destroy this audit log", match: :first

    assert_text "Audit log was successfully destroyed"
  end
end
