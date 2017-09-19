require 'app_helper'

describe LibraryService do
  subject(:library_service) { LibraryService.new }

  let(:expected_list) do
    dog_key = 'ZmFJM2VsWXkveEFFOTBxbmxTNDg5UT09OmRvZy5wZXQ='
    dog_path = "#{SPEC_PATH}/mock_library/dog.pet"
    alex_key = 'ZmFJM2VsWXkveEFFOTBxbmxTNDg5UT09OmFsZXgubWVu'
    alex_path = "#{SPEC_PATH}/mock_library/mens_club/alex.men"
    johny_key = 'ZmFJM2VsWXkveEFFOTBxbmxTNDg5UT09OmpvaG55Lm1lbg=='
    johny_path = "#{SPEC_PATH}/mock_library/mens_club/johny.men"
    jessica_key = 'ZmFJM2VsWXkveEFFOTBxbmxTNDg5UT09Omplc3NpY2Eud29tYW4='
    jessica_path = "#{SPEC_PATH}/mock_library/womans_club/jessica.woman"
    katie_key = 'ZmFJM2VsWXkveEFFOTBxbmxTNDg5UT09OmthdGllLndvbWFu'
    katie_path = "#{SPEC_PATH}/mock_library/womans_club/katie.woman"

    {
      dog_key => dog_path,
      alex_key => alex_path,
      johny_key => johny_path,
      jessica_key => jessica_path,
      katie_key => katie_path
    }
  end

  describe '#json_list' do
    before { library_service.fetch! }

    it 'returns plain json expected list' do
      expect(library_service.json_list).to eq(expected_list.to_json)
    end
  end

  describe '#list' do
    before { library_service.fetch! }

    it 'returns expected library list hash' do
      expect(library_service.list).to eq(expected_list)
    end
  end

  describe '#fetch!' do
    let(:list_file_path) { "#{LIBRARY_PATH}/list.json" }
    let(:list_file) { File.open(list_file_path, 'r') }

    before do
      File.delete(list_file_path)
      library_service.fetch!
    end

    it 'generates expected list file' do
      expect(list_file.read).to eq(expected_list.to_json)
    end
  end
end
