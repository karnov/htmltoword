require 'spec_helper'

describe Htmltoword::Document do
  describe "local_images" do
    let(:html) do
      <<-EOL
        <!DOCTYPE html>
        <html>
        <head></head>
        <body>
          <img src="https://placehold.it/50x50.png" style="width:50px;height:50px">
          <a href="http://www.example.com">
            <img src="https://placehold.it/10x10.png" style="width:10px;height:10px">
            Hello!
          </a>
          <p><img src="https://placehold.it/350x150.png" style="width:350px;height:150px"></p>
          <p><img src="https://placehold.it/400x250.jpg" style="width:400px;height:250px"></p>
          <p><img src="https://placehold.it/350x150.tiff" style="width:350px;height:150px"></p>
          <p><img src="https://placehold.it/400x250.gif" style="width:400px;height:250px"></p>
        </body>
        </html>
      EOL
    end

    #in order to test if the images files are embedded correctly we have to create_and_save, then open the zip and look for them. Then ensure that we cleanup the created file.
    #There is probably a better way of doing it as this seems very performance heavy but does have the advantage of testing the create method all the way through...
    it "should only embed local images" do
      filename = SecureRandom.urlsafe_base64
      begin
        docx = Htmltoword::Document.create_and_save(html, tmp_path(filename))
        Zip::File.open(tmp_path(filename)) do |zip_file|
          # Find specific entry
          expect(zip_file.glob('word/media/*').size).to eq 6
        end
      ensure
        #File.delete(tmp_path(filename))
      end
    end
  end
end