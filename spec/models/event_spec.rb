require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベント登録' do
    context '登録成功' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@event).to be_valid
      end
    end

    context '登録失敗' do
      it 'nameが空欄では登録できないこと' do
        @event.name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include "Name can't be blank"
      end
      it 'event_dateが空欄では登録できないこと' do
        @event.event_date = ''
        @event.valid?
        expect(@event.errors.full_messages).to include "Event date can't be blank", 'Event date is invalid'
      end

      it 'event_dateが全角数字では登録できないこと' do
        @event.event_date = '２０２４-０１-０１'
        @event.valid?
        expect(@event.errors.full_messages).to include "Event date can't be blank", 'Event date is invalid'
      end

      it 'event_dateが数字以外では登録できないこと' do
        @event.event_date = 'ああああ-ああ-ああ'
        @event.valid?
        expect(@event.errors.full_messages).to include "Event date can't be blank", 'Event date is invalid'
      end

      it 'event_dateが存在しない日付では登録できないこと' do
        @event.event_date = '9999-99-99'
        @event.valid?
        expect(@event.errors.full_messages).to include "Event date can't be blank", 'Event date is invalid'
      end

      it 'user_idが紐づいていない場合は登録できないこと' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
