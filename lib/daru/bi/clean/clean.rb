module Daru
  module BI
    module Clean
      def clean_names!
        @data.each do |vec|
          unless vec.db_type == 'VARCHAR (255)'
            next
          end
          vec.map! { |ele| ele
            .to_s
            .downcase
            .gsub!(/\W/,'_')
            .nil? ? ele.to_s.downcase : ele.to_s.downcase.gsub!(/\W/,'_') }
        end
        self
      end

      def clean_names
        dup.clean_names!
      end

      def rolling_fillna!(direction=:forward)
        @data.each { |vec| vec.rolling_fillna!(direction) }
        self
      end

      def rolling_fillna(direction=:forward)
        dup.rolling_fillna!(direction)
      end

      def filter axis=:vector, &block
        dispatch_to_axis_pl axis, :filter, &block
      end
  
      def uniq(*vtrs)
        vecs = vtrs.empty? ? vectors.map(&:to_s) : Array(vtrs)
        grouped = group_by(vecs)
        indexes = grouped.groups.values.map { |v| v[0] }.sort
        row[*indexes]
      end
    end
  end
end
