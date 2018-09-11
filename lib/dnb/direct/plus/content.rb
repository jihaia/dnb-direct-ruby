class DnB::Direct::Plus::Content
    # This service is the most efficient way to gain basic marketing information
    # about an existing customer or potential prospect such as business name,
    # address, D&B® D-U-N-S® Number, phone and trade style. Includes business
    # intelligence such as senior executive name, activities, sales, number of
    # employees and owners.
    def self.profile_with_linkage(params = {})
        start = Time.now
        puts "== Started profile_with_linkage at #{start}" if $LOG_DNB
        response = DnB::Direct::Plus.connection.get do |req|
            req.url "/v1/data/duns/#{params[:duns]}?productId=cmplnk&versionId=v1"
            req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
        end
        puts "== Completed in #{Time.now - start}s" if $LOG_DNB
        org = DnB::Direct::Plus::Mappings::Organization.extract_single(response.body, :read)
        org.payload = response.body if !org.nil? && org.respond_to?(:payload)
        org
    end # def self.profile_with_linkage

    # Converts the object into textual markup given a specific `format`
    # (defaults to `:html`)
    #
    # == Parameters:
    # format::
    #   A Symbol declaring the format to convert the object to. This
    #   can be `:text` or `:html`.
    #
    # == Returns:
    # A string representing the object in a specified
    # format.
    #
    def self.plus_executives(params = {})
      params[:version] ||= 'v2'
      response = DnB::Direct::Plus.connection.get do |req|
          req.url "/v1/data/duns/#{params[:duns]}?productId=cmpelk&versionId=#{params[:version]}"
          req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
      end
      JSON.parse(response.body)
    end # def self.plus_executives



    def self.family_tree(params = {})
      params[:version] ||= 'v1'
      params[:size] ||= 1000
      params[:page] ||= 1

      response = DnB::Direct::Plus.connection.get do |req|
          req.url "/#{params[:version]}/familyTree/#{params[:duns]}?page[number]=#{params[:page]}&page[size]=#{params[:size]}"
          req.headers[:authorization] = "Bearer #{DnB::Direct::Plus.api_token}"
      end
      JSON.parse(response.body)
    end # def self.family_tree
end # class
