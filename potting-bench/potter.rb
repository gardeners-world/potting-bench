require 'json'

module PottingBench
    class PlantSet < Array
        def initialize raw_input 
            @headers = raw_input.shift

            raw_input.each do |row|
                plant = {}
                row.each_with_index do |item, index|
                    if item != ''
                        key = @headers[index].downcase
                        if key == 'common name'
                            key = 'common name(s)'
                            item = PlantSet.divide item
                        else
                            item = item.clean
                        end
                        plant[key] = item
                    end
                end
                self.push plant
            end
        end

        def PlantSet.divide values
            values.split(',').map! do |v| 
                v.clean
            end
        end
    end
end

class String
    def clean 
        self.downcase.strip
    end
end