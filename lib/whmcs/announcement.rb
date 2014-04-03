module WHMCS
  class Announcement < Base
    # Add Announcement
    # This command is used to Add a new announcement to the system
    #
    # Parameters:
    # * <tt>:date</tt> - Date of the announcement in format yyyymmdd
    # * <tt>:title</tt> - Title of the announcement
    # * <tt>:announcement</tt> - Announcement text
    # * <tt>:published</tt> - on/off
    # 
    # Returns:
    #  * <tt>:result</tt>
    #  * <tt>:announcementid</tt>
    # See:
    #
    # http://docs.whmcs.com/API:Add_Announcement
    def self.add_announcement(params = {})
      params.merge!(:action => 'addannouncement')
      send_request(params)
    end

    # Update Announcement
    #
    # Parameters:
    # * <tt>:announcementid</tt> - ID of the announcement to edit
    # * <tt>:date</tt> - Date of the announcement in format yyyymmdd
    # * <tt>:title</tt> - Title of the announcement
    # * <tt>:announcement</tt> - Announcement text
    # * <tt>:published</tt> - on/off
    #
    # See:
    #
    # http://docs.whmcs.com/API:Update_Announcement
    def self.update_announcement(params = {})
      params.merge!(:action => 'updateannouncement')
      send_request(params)
    end

    # Get Announcements
    # This command is used to get a list of the announcements in XML format
    #
    # Parameters:
    # * <tt>:limitstart</tt> - used for pagination, start at a certain ID
    # * <tt>:limitnum</tt> - restrict number of records
    #
    # See:
    #
    # http://docs.whmcs.com/API:Get_Announcements
    def self.get_announcements(params ={})
      params.merge!(:action => 'getannouncements')
      send_request(params)
    end

    # Delete Announcement
    #
    # Parameters:
    # * <tt>:announcementid</tt> - The ID of the announcement to delete
    #
    # See:
    #
    # http://docs.whmcs.com/API:Delete_Announcement
    def self.delete_announcement(params = {})
      params.merge!(:action => 'deleteannouncement')
      send_request(params)
    end
  end

end
