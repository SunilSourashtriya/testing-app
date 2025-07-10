class ShardedRecord < ApplicationRecord
  self.abstract_class = true

  connects_to shards: {
    shard_1: { writing: :shard_1 },
    shard_2: { writing: :shard_2 }
  }
end
