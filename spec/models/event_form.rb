require 'rails_helper'

RSpec.describe EventForm, type: :model do
  before do
    event = FactoryBot.create(:event)
    @event_form = FactoryBot.build(:event_form, event_id: event.id)
  end

  describe 'イベントフォーム登録' do
    context '登録成功' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@event_form).to be_valid
      end
    end

    context '登録失敗' do
      it 'event_idが空欄では登録できないこと' do
        @event_form.event_id = ''
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Event can't be blank"
      end

      it 'version_numberが空欄では登録できないこと' do
        @event_form.version_number = ''
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Version number can't be blank"
      end

      it 'input_dateが空欄では登録できないこと' do
        @event_form.input_date = ''
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Input date can't be blank"
      end

      it 'adult_countが空欄では登録できないこと' do
        @event_form.adult_count = ''
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Adult count can't be blank"
      end

      it 'child_countが空欄では登録できないこと' do
        @event_form.child_count = ''
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Child count can't be blank"
      end

      it 'child_countが空欄では登録できないこと' do
        @event_form.ceremony_cost = ''
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Child count can't be blank"
      end
      it 'costが数値でない場合、登録できないこと' do
        @event_form.cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Cost is not a number"
      end

      it 'adult_countが数値でない場合、登録できないこと' do
        @event_form.adult_count = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Adult count is not a number"
      end

      it 'child_countが数値でない場合、登録できないこと' do
        @event_form.child_count = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Child count is not a number"
      end

      it 'ceremony_costが数値でない場合、登録できないこと' do
        @event_form.ceremony_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Ceremony cost is not a number"
      end

      it 'food_costが数値でない場合、登録できないこと' do
        @event_form.food_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Food cost is not a number"
      end

      it 'venue_costが数値でない場合、登録できないこと' do
        @event_form.venue_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Venue cost is not a number"
      end

      it 'costume_costが数値でない場合、登録できないこと' do
        @event_form.costume_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Costume cost is not a number"
      end

      it 'beauty_costが数値でない場合、登録できないこと' do
        @event_form.beauty_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Beauty cost is not a number"
      end

      it 'flower_costが数値でない場合、登録できないこと' do
        @event_form.flower_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Flower cost is not a number"
      end

      it 'print_costが数値でない場合、登録できないこと' do
        @event_form.print_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Print cost is not a number"
      end

      it 'staging_costが数値でない場合、登録できないこと' do
        @event_form.staging_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Staging cost is not a number"
      end

      it 'photo_costが数値でない場合、登録できないこと' do
        @event_form.photo_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Photo cost is not a number"
      end

      it 'video_costが数値でない場合、登録できないこと' do
        @event_form.video_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Video cost is not a number"
      end

      it 'gift_costが数値でない場合、登録できないこと' do
        @event_form.gift_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Gift cost is not a number"
      end

      it 'pre_ceremony_costが数値でない場合、登録できないこと' do
        @event_form.pre_ceremony_cost = 'abc'
        @event_form.valid?
        expect(@event_form.errors.full_messages).to include "Pre ceremony cost is not a number"
      end
    end
  end
end
