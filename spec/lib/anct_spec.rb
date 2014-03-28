require 'spec_helper'

require 'anct'


describe Anct do

  describe 'fiscal_year' do
    context 'without parameters' do
      it 'return this fiscal year' do
        t = Time.now
        year = if t.month > 4 then t.year
            elsif t.month < 4 then t.year - 1
            elsif t.day == 1 then t.year - 1
            else t.year
            end
        expect(Anct.fiscal_year).to eq year
      end
    end

    context 'with parameter' do
      it 'return the fiscal year (2014/3/1)' do
        expect(Anct.fiscal_year(DateTime.parse("2014/03/01"))).to eq 2013
      end

      it 'return the fiscal year (2014/4/2)' do
        expect(Anct.fiscal_year(DateTime.parse("2014/04/02"))).to eq 2014
      end
    end
  end

  describe 'term' do
    context 'with parameter' do
      it 'return this term' do
        t = Time.now
        index = if t.month < 4 || 9 < t.month then 1
                else 0
                end
        expect(Anct.term).to eq Settings.timetable.term[index]
      end
    end

    context 'with parameter' do
      it 'return 前期 (2014/4/2)' do
        expect(Anct.term(DateTime.parse("2014/04/02"))).to eq Settings.timetable.term[0]
      end

      it 'return 後期 (2014/10/2)' do
        expect(Anct.term(DateTime.parse("2014/10/02"))).to eq Settings.timetable.term[1]
      end
    end
  end
end
