def test_file_exists(host):
    ralph = host.file('/ralph.yml')
    assert ralph.exists
    assert ralph.contains('your')

# def test_ralph_is_installed(host):
#     ralph = host.package('ralph')
#     assert ralph.is_installed
#
#
# def test_user_and_group_exist(host):
#     user = host.user('ralph')
#     assert user.group == 'ralph'
#     assert user.home == '/var/lib/ralph'
#
#
# def test_service_is_running_and_enabled(host):
#     ralph = host.service('ralph')
#     assert ralph.is_enabled
#     assert ralph.is_running
