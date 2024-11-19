require 'acceptance_helper'

resource "posts" do
  get "/api/v1/posts" do
    example "Listing posts" do
      do_request

      expect(status).to eq 200
    end
  end
end