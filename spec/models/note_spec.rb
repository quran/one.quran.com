require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }

  describe 'association with user' do
    let(:note) { create(:note, user: user) }
    let(:bookmark_with_same_key1) { create(:note, ayah_key: '1:1', user: user) }
    let(:bookmark_with_same_key2) { build(:note, ayah_key: '1:1', user: user) }

    it 'should have user' do
      expect(note).to be_valid
      expect(note.user).to eql(user)
    end

    it 'should not allow for nil user' do
      invalid_note = Note.new
      expect(invalid_note).to_not be_valid
    end

    it 'should not allow a user to have bookmarks with same ayah key' do
      expect(bookmark_with_same_key1.ayah_key).to eql(bookmark_with_same_key2.ayah_key)
      expect(bookmark_with_same_key1).to be_valid
      expect(bookmark_with_same_key2).to_not be_valid
    end
  end

  describe '#ayah_key' do
    let(:invalid_note) { build(:note, ayah_key: nil) }

    it 'should not allow for nil ayah_key' do
      expect(invalid_note).to_not be_valid
    end

    it 'should create ayah with number:number format' do
      expect(Note.new(ayah_key: '1:1', user: user, text: 'text')).to be_valid
      expect(Note.new(ayah_key: 'abc:1', user: user, text: 'text')).to_not be_valid
    end
  end

  describe '#text' do
    let(:invalid_note) { build(:note, text: nil) }

    it 'should not allow for nil ayah_key' do
      expect(invalid_note).to_not be_valid
    end
  end
end
