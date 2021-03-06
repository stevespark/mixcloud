require 'mixcloud'

describe "Mixcloud::Category" do

  before do
    category_data = {"name"=>"Ambient", 
                     "format"=>"music", 
                     "url"=>"http://www.mixcloud.com/categories/ambient/",
                     "pictures"=> {"small"=>"http://tb1.mixcloud.com/w/25/h/25/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "large"=>"http://tb1.mixcloud.com/w/300/h/300/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "medium"=>"http://tb1.mixcloud.com/w/150/h/150/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "thumbnail"=>"http://tb1.mixcloud.com/w/50/h/50/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "medium_mobile"=>"http://tb1.mixcloud.com/w/80/h/80/q/75/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg"}, 
                     "key"=>"/categories/ambient/", 
                     "type"=>"category", 
                     "slug"=>"ambient", 
                     "metadata"=> {"connections"=>{
                                   "userpick-users"=>"http://api.mixcloud.com/categories/ambient/userpick-users/", 
                                   "userpick-cloudcasts"=>"http://api.mixcloud.com/categories/ambient/userpick-cloudcasts/",
                                   "cloudcasts"=>"http://api.mixcloud.com/categories/ambient/cloudcasts/", 
                                   "users"=>"http://api.mixcloud.com/categories/ambient/users/"}
                                  }
                    }
    JSON.stub(:parse).and_return(category_data)
  end
                      
  let(:category) { Mixcloud::Category.new('http://api.mixcloud.com/categories/ambient/?=metadata=1') }

  describe "instances" do
    it "should not have an instance variable named @metadata" do
      category.instance_variables.should_not include(:@metadata)
    end

    it "should not have an instance variable named @pictures" do
      category.instance_variables.should_not include(:@pictures)
    end

    it "should have an instance variable named @public_url" do
      category.instance_variables.should include(:@public_url)
    end

    it "have @public_url set to the correct value" do
      category.public_url.should eq "http://www.mixcloud.com/categories/ambient/"
    end

    it "should have an instance variable named @api_url" do
      category.instance_variables.should include(:@api_url)
    end

    it "have @api_url set to the correct value" do
      category.api_url.should eq "http://api.mixcloud.com/categories/ambient/?metadata=1"
    end
  end
  
  describe "#userpick_users_url" do
    it "should return the url of its userpick_users" do
      category.userpick_users_url.should eq 'http://api.mixcloud.com/categories/ambient/userpick-users/'
    end
  end

  describe "#userpick_cloudcasts_url" do
    it "should return the url of its userpick_cloudcasts" do
      category.userpick_cloudcasts_url.should eq 'http://api.mixcloud.com/categories/ambient/userpick-cloudcasts/'
    end
  end

  describe "#users_url" do
    it "should return the url of its users" do
      category.users_url.should eq 'http://api.mixcloud.com/categories/ambient/users/'
    end
  end

  describe "#cloudcasts_url" do
    it "should return the url of its cloudcasts" do
      category.cloudcasts_url.should eq 'http://api.mixcloud.com/categories/ambient/cloudcasts/'
    end
  end

  describe "#small_picture_url" do
    it "should return the url of its small_picture" do
      category.small_picture_url.should eq 'http://tb1.mixcloud.com/w/25/h/25/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#large_picture_url" do
    it "should return the url of its large_picture" do
      category.large_picture_url.should eq 'http://tb1.mixcloud.com/w/300/h/300/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#medium_picture_url" do
    it "should return the url of its medium_picture" do
      category.medium_picture_url.should eq 'http://tb1.mixcloud.com/w/150/h/150/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#thumbnail_picture_url" do
    it "should return the url of its thumbnail_picturel" do
      category.thumbnail_picture_url.should eq 'http://tb1.mixcloud.com/w/50/h/50/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#medium_mobile_picture_url" do
    it "should return the url of its medium_mobile_picture" do
      category.medium_mobile_picture_url.should eq 'http://tb1.mixcloud.com/w/80/h/80/q/75/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end
  
end