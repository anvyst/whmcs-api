require_relative 'test_helper'

class WHMCSAnnouncementTest < Test::Unit::TestCase
  # dummy testing of announcement functionality
  def test__basic_announcement_crud__passingValidData
    passing_data = {
      :date => '2014-04-01',
      :title => 'Test Announcement1',
      :announcement => 'Test Hello World announcement',
      :published    => 'off'
    }

    resulted_announce = WHMCS::Announcement.get_announcements()

    resulted = WHMCS::Announcement.add_announcement( passing_data )
    
    updated_announcement = WHMCS::Announcement.update_announcement(
      :announcementid => resulted['announcementid'],
      :title          => 'Test Hello World announcement 2'
    )
    
    deleted_announcement = WHMCS::Announcement.delete_announcement(:announcementid => resulted['announcementid'])

    assert_equal('success', updated_announcement['result'])
    assert_equal(resulted['announcementid'], deleted_announcement['announcementid'])
    assert_equal('success', deleted_announcement['result'])
    assert_equal('success', resulted['result'])
  end
end
