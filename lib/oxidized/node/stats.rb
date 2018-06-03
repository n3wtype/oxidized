module Oxidized
  class Node
    class Stats
      MAX_STAT = 10

      # @param [Job] job job whose information add to stats
      # @return [void]
      def add job
        stat = {
          :start  => job.start,
          :end    => job.end,
          :time   => job.time,
        }
        @stats[job.status] ||= []
        @stats[job.status].shift if @stats[job.status].size > MAX_STAT
        @stats[job.status].push stat
        @stats[:counter][job.status] += 1
      end

      # @param [Symbol] status stats for specific status
      # @return [Hash,Array] Hash of stats for every status or Array of stats for specific status
      def get status = nil
        status ? @stats[status] : @stats
      end

      private

      def initialize
        @stats = {}
        @stats[:counter] = Hash.new 0
      end
    end
  end
end
