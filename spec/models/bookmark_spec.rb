require 'rails_helper'

RSpec.fdescribe Bookmark, type: :model do
  let(:user) { create(:user) }

  describe 'association with user' do
    let(:bookmark) { create(:bookmark, user: user) }
    let(:bookmark_with_same_key1) { create(:bookmark, ayah_key: '1:1', user: user) }
    let(:bookmark_with_same_key2) { build(:bookmark, ayah_key: '1:1', user: user) }

    it 'should have user' do
      expect(bookmark).to be_valid
      expect(bookmark.user).to eql(user)
    end

    it 'should not allow for nil user' do
      invalid_bookmark = Bookmark.new
      expect(invalid_bookmark).to_not be_valid
    end

    it 'should not allow a user to have bookmarks with same ayah key' do
      expect(bookmark_with_same_key1.ayah_key).to eql(bookmark_with_same_key2.ayah_key)
      expect(bookmark_with_same_key1).to be_valid
      expect(bookmark_with_same_key2).to_not be_valid
    end
  end

  describe '#ayah_key' do
    let(:invalid_bookmark) { build(:bookmark, ayah_key: nil) }

    it 'should not allow for nil ayah_key' do
      expect(invalid_bookmark).to_not be_valid
    end

    it 'should create ayah with number:number format' do
      expect(Bookmark.new(ayah_key: '1:1', user: user)).to be_valid
      expect(Bookmark.new(ayah_key: 'abc:1', user: user)).to_not be_valid
    end
  end
end
