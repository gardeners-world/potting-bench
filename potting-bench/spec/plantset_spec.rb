require 'base64'
require 'json'

module PottingBench 
    describe PlantSet do
        let(:raw_input) {
            JSON.parse Base64.decode64 File.read 'spec/fixtures/raw-plants.base64'
        }
        let(:plantset) {
            PlantSet.new raw_input
        }

        it 'has the correct data' do
            expect(plantset[0..3]).to eq [
                {
                    "plant"=>"alocasia",
                    "variety"=>"zebrina",
                    "common name(s)"=>["elephant ears"],
                    "wikipedia url"=>"https://en.wikipedia.org/wiki/alocasia"
                },
                {
                    "plant"=>"aloe"
                },
                {
                    "plant"=>"begonia",
                    "variety"=>"maculata",
                    "common name(s)"=>["polka dot begonia", "trout begonia"]
                },
                {
                    "plant"=>"cactus"
                }
            ]
        end

        it 'splits a string' do
            string = "Foo, Bar "
            expect(described_class.divide string).to eq ['foo', 'bar']
        end
    end
end

describe String do 
    it 'cleans a string' do
        expect(' String '.clean).to eq 'string'
    end
end