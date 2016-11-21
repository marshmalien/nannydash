require 'rails_helper'

RSpec.describe JobsController, type: :controller do

  before do
    @sitter = create(:user)
    @family = create(:recipient)
    @first_job = create(:job)
    @assigned_job = create(:assigned_job)
  end

  describe 'GET #index' do
    it 'returns array of jobs with sitter assigned' do

      get :index

      json = JSON.parse(response.body)

      expect(json.length).to eq 1
    end
  end

  describe 'GET #get_new_jobs' do
    it 'returns an array of jobs without a sitter' do

      get :get_new_jobs

      json = JSON.parse(response.body)

      expect(json[0]["job_id"]).to eq 1
    end

    it 'will not return assigned jobs' do

      get :get_new_jobs

      json = JSON.parse(response.body)

      expect(json[0]["job_id"]).to_not eq 2
    end
  end

  describe 'GET #show' do
    it 'returns details about a specific job' do

      process :show, method: :get, params: { id: @first_job.id }

      json = JSON.parse(response.body)
      
      expect(json["family_id"]).to eq 2
    end
  end

end
