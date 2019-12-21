extension ResponseBodyStub {
    static let getFavoritesSuccess: ResponseBodyStub =
    """
    {
    "user_name": "yaroslavz",
    "favorites": {
    "public_favorites": [
      {
        "id_hash": "xipm41yr",
        "name": "AddQuestionToFavorite",
        "description": "",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          }
        ],
        "is_public_favorite": true,
        "view_count": 1,
        "creator": "yaroslavz",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "xipgnsn3",
        "name": "AddQuestionToNewFavorite",
        "description": "",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          }
        ],
        "is_public_favorite": true,
        "view_count": 1,
        "creator": "yaroslavz",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "xipajor5",
        "name": "DeleteFavoriteList",
        "description": "",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          }
        ],
        "is_public_favorite": true,
        "view_count": 1,
        "creator": "yaroslavz",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "xl1kmuc2",
        "name": "Favorite",
        "description": "",
        "questions": [],
        "is_public_favorite": true,
        "view_count": 1,
        "creator": "yaroslavz",
        "current_user": "",
        "is_watched": false
      }
    ],
    "private_favorites": [],
    "leetcode_favorites": [
      {
        "id_hash": "79h8rn6",
        "name": "Top 100 Liked Questions",
        "description": "",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          },
          {
            "id": 2,
            "title": "Add Two Numbers",
            "title_slug": "add-two-numbers"
          },
          {
            "id": 3,
            "title": "Longest Substring Without Repeating Characters",
            "title_slug": "longest-substring-without-repeating-characters"
          },
          {
            "id": 4,
            "title": "Median of Two Sorted Arrays",
            "title_slug": "median-of-two-sorted-arrays"
          },
          {
            "id": 5,
            "title": "Longest Palindromic Substring",
            "title_slug": "longest-palindromic-substring"
          },
          {
            "id": 10,
            "title": "Regular Expression Matching",
            "title_slug": "regular-expression-matching"
          },
          {
            "id": 11,
            "title": "Container With Most Water",
            "title_slug": "container-with-most-water"
          },
          {
            "id": 15,
            "title": "3Sum",
            "title_slug": "3sum"
          },
          {
            "id": 17,
            "title": "Letter Combinations of a Phone Number",
            "title_slug": "letter-combinations-of-a-phone-number"
          },
          {
            "id": 19,
            "title": "Remove Nth Node From End of List",
            "title_slug": "remove-nth-node-from-end-of-list"
          },
          {
            "id": 20,
            "title": "Valid Parentheses",
            "title_slug": "valid-parentheses"
          },
          {
            "id": 21,
            "title": "Merge Two Sorted Lists",
            "title_slug": "merge-two-sorted-lists"
          },
          {
            "id": 22,
            "title": "Generate Parentheses",
            "title_slug": "generate-parentheses"
          },
          {
            "id": 23,
            "title": "Merge k Sorted Lists",
            "title_slug": "merge-k-sorted-lists"
          },
          {
            "id": 31,
            "title": "Next Permutation",
            "title_slug": "next-permutation"
          },
          {
            "id": 32,
            "title": "Longest Valid Parentheses",
            "title_slug": "longest-valid-parentheses"
          },
          {
            "id": 33,
            "title": "Search in Rotated Sorted Array",
            "title_slug": "search-in-rotated-sorted-array"
          },
          {
            "id": 34,
            "title": "Find First and Last Position of Element in Sorted Array",
            "title_slug": "find-first-and-last-position-of-element-in-sorted-array"
          },
          {
            "id": 39,
            "title": "Combination Sum",
            "title_slug": "combination-sum"
          },
          {
            "id": 41,
            "title": "First Missing Positive",
            "title_slug": "first-missing-positive"
          },
          {
            "id": 42,
            "title": "Trapping Rain Water",
            "title_slug": "trapping-rain-water"
          },
          {
            "id": 46,
            "title": "Permutations",
            "title_slug": "permutations"
          },
          {
            "id": 48,
            "title": "Rotate Image",
            "title_slug": "rotate-image"
          },
          {
            "id": 49,
            "title": "Group Anagrams",
            "title_slug": "group-anagrams"
          },
          {
            "id": 53,
            "title": "Maximum Subarray",
            "title_slug": "maximum-subarray"
          },
          {
            "id": 55,
            "title": "Jump Game",
            "title_slug": "jump-game"
          },
          {
            "id": 56,
            "title": "Merge Intervals",
            "title_slug": "merge-intervals"
          },
          {
            "id": 62,
            "title": "Unique Paths",
            "title_slug": "unique-paths"
          },
          {
            "id": 64,
            "title": "Minimum Path Sum",
            "title_slug": "minimum-path-sum"
          },
          {
            "id": 70,
            "title": "Climbing Stairs",
            "title_slug": "climbing-stairs"
          },
          {
            "id": 72,
            "title": "Edit Distance",
            "title_slug": "edit-distance"
          },
          {
            "id": 75,
            "title": "Sort Colors",
            "title_slug": "sort-colors"
          },
          {
            "id": 76,
            "title": "Minimum Window Substring",
            "title_slug": "minimum-window-substring"
          },
          {
            "id": 78,
            "title": "Subsets",
            "title_slug": "subsets"
          },
          {
            "id": 79,
            "title": "Word Search",
            "title_slug": "word-search"
          },
          {
            "id": 84,
            "title": "Largest Rectangle in Histogram",
            "title_slug": "largest-rectangle-in-histogram"
          },
          {
            "id": 85,
            "title": "Maximal Rectangle",
            "title_slug": "maximal-rectangle"
          },
          {
            "id": 94,
            "title": "Binary Tree Inorder Traversal",
            "title_slug": "binary-tree-inorder-traversal"
          },
          {
            "id": 96,
            "title": "Unique Binary Search Trees",
            "title_slug": "unique-binary-search-trees"
          },
          {
            "id": 98,
            "title": "Validate Binary Search Tree",
            "title_slug": "validate-binary-search-tree"
          },
          {
            "id": 101,
            "title": "Symmetric Tree",
            "title_slug": "symmetric-tree"
          },
          {
            "id": 102,
            "title": "Binary Tree Level Order Traversal",
            "title_slug": "binary-tree-level-order-traversal"
          },
          {
            "id": 104,
            "title": "Maximum Depth of Binary Tree",
            "title_slug": "maximum-depth-of-binary-tree"
          },
          {
            "id": 105,
            "title": "Construct Binary Tree from Preorder and Inorder Traversal",
            "title_slug": "construct-binary-tree-from-preorder-and-inorder-traversal"
          },
          {
            "id": 114,
            "title": "Flatten Binary Tree to Linked List",
            "title_slug": "flatten-binary-tree-to-linked-list"
          },
          {
            "id": 121,
            "title": "Best Time to Buy and Sell Stock",
            "title_slug": "best-time-to-buy-and-sell-stock"
          },
          {
            "id": 124,
            "title": "Binary Tree Maximum Path Sum",
            "title_slug": "binary-tree-maximum-path-sum"
          },
          {
            "id": 128,
            "title": "Longest Consecutive Sequence",
            "title_slug": "longest-consecutive-sequence"
          },
          {
            "id": 136,
            "title": "Single Number",
            "title_slug": "single-number"
          },
          {
            "id": 138,
            "title": "Copy List with Random Pointer",
            "title_slug": "copy-list-with-random-pointer"
          },
          {
            "id": 139,
            "title": "Word Break",
            "title_slug": "word-break"
          },
          {
            "id": 141,
            "title": "Linked List Cycle",
            "title_slug": "linked-list-cycle"
          },
          {
            "id": 142,
            "title": "Linked List Cycle II",
            "title_slug": "linked-list-cycle-ii"
          },
          {
            "id": 146,
            "title": "LRU Cache",
            "title_slug": "lru-cache"
          },
          {
            "id": 148,
            "title": "Sort List",
            "title_slug": "sort-list"
          },
          {
            "id": 152,
            "title": "Maximum Product Subarray",
            "title_slug": "maximum-product-subarray"
          },
          {
            "id": 155,
            "title": "Min Stack",
            "title_slug": "min-stack"
          },
          {
            "id": 160,
            "title": "Intersection of Two Linked Lists",
            "title_slug": "intersection-of-two-linked-lists"
          },
          {
            "id": 169,
            "title": "Majority Element",
            "title_slug": "majority-element"
          },
          {
            "id": 198,
            "title": "House Robber",
            "title_slug": "house-robber"
          },
          {
            "id": 200,
            "title": "Number of Islands",
            "title_slug": "number-of-islands"
          },
          {
            "id": 206,
            "title": "Reverse Linked List",
            "title_slug": "reverse-linked-list"
          },
          {
            "id": 207,
            "title": "Course Schedule",
            "title_slug": "course-schedule"
          },
          {
            "id": 208,
            "title": "Implement Trie (Prefix Tree)",
            "title_slug": "implement-trie-prefix-tree"
          },
          {
            "id": 215,
            "title": "Kth Largest Element in an Array",
            "title_slug": "kth-largest-element-in-an-array"
          },
          {
            "id": 221,
            "title": "Maximal Square",
            "title_slug": "maximal-square"
          },
          {
            "id": 226,
            "title": "Invert Binary Tree",
            "title_slug": "invert-binary-tree"
          },
          {
            "id": 234,
            "title": "Palindrome Linked List",
            "title_slug": "palindrome-linked-list"
          },
          {
            "id": 236,
            "title": "Lowest Common Ancestor of a Binary Tree",
            "title_slug": "lowest-common-ancestor-of-a-binary-tree"
          },
          {
            "id": 238,
            "title": "Product of Array Except Self",
            "title_slug": "product-of-array-except-self"
          },
          {
            "id": 239,
            "title": "Sliding Window Maximum",
            "title_slug": "sliding-window-maximum"
          },
          {
            "id": 240,
            "title": "Search a 2D Matrix II",
            "title_slug": "search-a-2d-matrix-ii"
          },
          {
            "id": 253,
            "title": "Meeting Rooms II",
            "title_slug": "meeting-rooms-ii"
          },
          {
            "id": 279,
            "title": "Perfect Squares",
            "title_slug": "perfect-squares"
          },
          {
            "id": 283,
            "title": "Move Zeroes",
            "title_slug": "move-zeroes"
          },
          {
            "id": 287,
            "title": "Find the Duplicate Number",
            "title_slug": "find-the-duplicate-number"
          },
          {
            "id": 295,
            "title": "Find Median from Data Stream",
            "title_slug": "find-median-from-data-stream"
          },
          {
            "id": 297,
            "title": "Serialize and Deserialize Binary Tree",
            "title_slug": "serialize-and-deserialize-binary-tree"
          },
          {
            "id": 300,
            "title": "Longest Increasing Subsequence",
            "title_slug": "longest-increasing-subsequence"
          },
          {
            "id": 301,
            "title": "Remove Invalid Parentheses",
            "title_slug": "remove-invalid-parentheses"
          },
          {
            "id": 309,
            "title": "Best Time to Buy and Sell Stock with Cooldown",
            "title_slug": "best-time-to-buy-and-sell-stock-with-cooldown"
          },
          {
            "id": 312,
            "title": "Burst Balloons",
            "title_slug": "burst-balloons"
          },
          {
            "id": 322,
            "title": "Coin Change",
            "title_slug": "coin-change"
          },
          {
            "id": 337,
            "title": "House Robber III",
            "title_slug": "house-robber-iii"
          },
          {
            "id": 338,
            "title": "Counting Bits",
            "title_slug": "counting-bits"
          },
          {
            "id": 347,
            "title": "Top K Frequent Elements",
            "title_slug": "top-k-frequent-elements"
          },
          {
            "id": 394,
            "title": "Decode String",
            "title_slug": "decode-string"
          },
          {
            "id": 406,
            "title": "Queue Reconstruction by Height",
            "title_slug": "queue-reconstruction-by-height"
          },
          {
            "id": 416,
            "title": "Partition Equal Subset Sum",
            "title_slug": "partition-equal-subset-sum"
          },
          {
            "id": 437,
            "title": "Path Sum III",
            "title_slug": "path-sum-iii"
          },
          {
            "id": 438,
            "title": "Find All Anagrams in a String",
            "title_slug": "find-all-anagrams-in-a-string"
          },
          {
            "id": 448,
            "title": "Find All Numbers Disappeared in an Array",
            "title_slug": "find-all-numbers-disappeared-in-an-array"
          },
          {
            "id": 494,
            "title": "Target Sum",
            "title_slug": "target-sum"
          },
          {
            "id": 543,
            "title": "Diameter of Binary Tree",
            "title_slug": "diameter-of-binary-tree"
          },
          {
            "id": 560,
            "title": "Subarray Sum Equals K",
            "title_slug": "subarray-sum-equals-k"
          },
          {
            "id": 581,
            "title": "Shortest Unsorted Continuous Subarray",
            "title_slug": "shortest-unsorted-continuous-subarray"
          },
          {
            "id": 617,
            "title": "Merge Two Binary Trees",
            "title_slug": "merge-two-binary-trees"
          },
          {
            "id": 621,
            "title": "Task Scheduler",
            "title_slug": "task-scheduler"
          },
          {
            "id": 647,
            "title": "Palindromic Substrings",
            "title_slug": "palindromic-substrings"
          },
          {
            "id": 739,
            "title": "Daily Temperatures",
            "title_slug": "daily-temperatures"
          }
        ],
        "is_public_favorite": true,
        "view_count": 2,
        "creator": "LeetCode",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "7p5x763",
        "name": "Top Amazon Questions",
        "description": "",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          },
          {
            "id": 2,
            "title": "Add Two Numbers",
            "title_slug": "add-two-numbers"
          },
          {
            "id": 5,
            "title": "Longest Palindromic Substring",
            "title_slug": "longest-palindromic-substring"
          },
          {
            "id": 20,
            "title": "Valid Parentheses",
            "title_slug": "valid-parentheses"
          },
          {
            "id": 21,
            "title": "Merge Two Sorted Lists",
            "title_slug": "merge-two-sorted-lists"
          },
          {
            "id": 23,
            "title": "Merge k Sorted Lists",
            "title_slug": "merge-k-sorted-lists"
          },
          {
            "id": 42,
            "title": "Trapping Rain Water",
            "title_slug": "trapping-rain-water"
          },
          {
            "id": 49,
            "title": "Group Anagrams",
            "title_slug": "group-anagrams"
          },
          {
            "id": 99,
            "title": "Recover Binary Search Tree",
            "title_slug": "recover-binary-search-tree"
          },
          {
            "id": 103,
            "title": "Binary Tree Zigzag Level Order Traversal",
            "title_slug": "binary-tree-zigzag-level-order-traversal"
          },
          {
            "id": 124,
            "title": "Binary Tree Maximum Path Sum",
            "title_slug": "binary-tree-maximum-path-sum"
          },
          {
            "id": 126,
            "title": "Word Ladder II",
            "title_slug": "word-ladder-ii"
          },
          {
            "id": 127,
            "title": "Word Ladder",
            "title_slug": "word-ladder"
          },
          {
            "id": 138,
            "title": "Copy List with Random Pointer",
            "title_slug": "copy-list-with-random-pointer"
          },
          {
            "id": 139,
            "title": "Word Break",
            "title_slug": "word-break"
          },
          {
            "id": 146,
            "title": "LRU Cache",
            "title_slug": "lru-cache"
          },
          {
            "id": 200,
            "title": "Number of Islands",
            "title_slug": "number-of-islands"
          },
          {
            "id": 212,
            "title": "Word Search II",
            "title_slug": "word-search-ii"
          },
          {
            "id": 240,
            "title": "Search a 2D Matrix II",
            "title_slug": "search-a-2d-matrix-ii"
          },
          {
            "id": 253,
            "title": "Meeting Rooms II",
            "title_slug": "meeting-rooms-ii"
          },
          {
            "id": 273,
            "title": "Integer to English Words",
            "title_slug": "integer-to-english-words"
          },
          {
            "id": 295,
            "title": "Find Median from Data Stream",
            "title_slug": "find-median-from-data-stream"
          },
          {
            "id": 297,
            "title": "Serialize and Deserialize Binary Tree",
            "title_slug": "serialize-and-deserialize-binary-tree"
          },
          {
            "id": 341,
            "title": "Flatten Nested List Iterator",
            "title_slug": "flatten-nested-list-iterator"
          },
          {
            "id": 347,
            "title": "Top K Frequent Elements",
            "title_slug": "top-k-frequent-elements"
          },
          {
            "id": 348,
            "title": "Design Tic-Tac-Toe",
            "title_slug": "design-tic-tac-toe"
          },
          {
            "id": 380,
            "title": "Insert Delete GetRandom O(1)",
            "title_slug": "insert-delete-getrandom-o1"
          },
          {
            "id": 388,
            "title": "Longest Absolute File Path",
            "title_slug": "longest-absolute-file-path"
          },
          {
            "id": 456,
            "title": "132 Pattern",
            "title_slug": "132-pattern"
          },
          {
            "id": 460,
            "title": "LFU Cache",
            "title_slug": "lfu-cache"
          },
          {
            "id": 472,
            "title": "Concatenated Words",
            "title_slug": "concatenated-words"
          },
          {
            "id": 545,
            "title": "Boundary of Binary Tree",
            "title_slug": "boundary-of-binary-tree"
          },
          {
            "id": 572,
            "title": "Subtree of Another Tree",
            "title_slug": "subtree-of-another-tree"
          },
          {
            "id": 642,
            "title": "Design Search Autocomplete System",
            "title_slug": "design-search-autocomplete-system"
          },
          {
            "id": 692,
            "title": "Top K Frequent Words",
            "title_slug": "top-k-frequent-words"
          },
          {
            "id": 761,
            "title": "Employee Free Time",
            "title_slug": "employee-free-time"
          },
          {
            "id": 785,
            "title": "Basic Calculator III",
            "title_slug": "basic-calculator-iii"
          },
          {
            "id": 837,
            "title": "Most Common Word",
            "title_slug": "most-common-word"
          },
          {
            "id": 897,
            "title": "Prime Palindrome",
            "title_slug": "prime-palindrome"
          },
          {
            "id": 974,
            "title": "Reorder Data in Log Files",
            "title_slug": "reorder-data-in-log-files"
          },
          {
            "id": 994,
            "title": "Prison Cells After N Days",
            "title_slug": "prison-cells-after-n-days"
          },
          {
            "id": 1014,
            "title": "K Closest Points to Origin",
            "title_slug": "k-closest-points-to-origin"
          },
          {
            "id": 1022,
            "title": "Unique Paths III",
            "title_slug": "unique-paths-iii"
          },
          {
            "id": 1036,
            "title": "Rotting Oranges",
            "title_slug": "rotting-oranges"
          },
          {
            "id": 1042,
            "title": "Minimum Cost to Merge Stones",
            "title_slug": "minimum-cost-to-merge-stones"
          },
          {
            "id": 1083,
            "title": "Two Sum Less Than K",
            "title_slug": "two-sum-less-than-k"
          },
          {
            "id": 1099,
            "title": "Path With Maximum Minimum Value",
            "title_slug": "path-with-maximum-minimum-value"
          },
          {
            "id": 1122,
            "title": "Longest Duplicate Substring",
            "title_slug": "longest-duplicate-substring"
          },
          {
            "id": 1126,
            "title": "Minimum Cost to Connect Sticks",
            "title_slug": "minimum-cost-to-connect-sticks"
          },
          {
            "id": 1300,
            "title": "Critical Connections in a Network",
            "title_slug": "critical-connections-in-a-network"
          }
        ],
        "is_public_favorite": true,
        "view_count": 10,
        "creator": "LeetCode",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "7p59281",
        "name": "Top Facebook Questions",
        "description": "",
        "questions": [
          {
            "id": 23,
            "title": "Merge k Sorted Lists",
            "title_slug": "merge-k-sorted-lists"
          },
          {
            "id": 31,
            "title": "Next Permutation",
            "title_slug": "next-permutation"
          },
          {
            "id": 34,
            "title": "Find First and Last Position of Element in Sorted Array",
            "title_slug": "find-first-and-last-position-of-element-in-sorted-array"
          },
          {
            "id": 56,
            "title": "Merge Intervals",
            "title_slug": "merge-intervals"
          },
          {
            "id": 65,
            "title": "Valid Number",
            "title_slug": "valid-number"
          },
          {
            "id": 67,
            "title": "Add Binary",
            "title_slug": "add-binary"
          },
          {
            "id": 71,
            "title": "Simplify Path",
            "title_slug": "simplify-path"
          },
          {
            "id": 76,
            "title": "Minimum Window Substring",
            "title_slug": "minimum-window-substring"
          },
          {
            "id": 98,
            "title": "Validate Binary Search Tree",
            "title_slug": "validate-binary-search-tree"
          },
          {
            "id": 124,
            "title": "Binary Tree Maximum Path Sum",
            "title_slug": "binary-tree-maximum-path-sum"
          },
          {
            "id": 125,
            "title": "Valid Palindrome",
            "title_slug": "valid-palindrome"
          },
          {
            "id": 133,
            "title": "Clone Graph",
            "title_slug": "clone-graph"
          },
          {
            "id": 139,
            "title": "Word Break",
            "title_slug": "word-break"
          },
          {
            "id": 158,
            "title": "Read N Characters Given Read4 II - Call multiple times",
            "title_slug": "read-n-characters-given-read4-ii-call-multiple-times"
          },
          {
            "id": 173,
            "title": "Binary Search Tree Iterator",
            "title_slug": "binary-search-tree-iterator"
          },
          {
            "id": 199,
            "title": "Binary Tree Right Side View",
            "title_slug": "binary-tree-right-side-view"
          },
          {
            "id": 211,
            "title": "Add and Search Word - Data structure design",
            "title_slug": "add-and-search-word-data-structure-design"
          },
          {
            "id": 215,
            "title": "Kth Largest Element in an Array",
            "title_slug": "kth-largest-element-in-an-array"
          },
          {
            "id": 238,
            "title": "Product of Array Except Self",
            "title_slug": "product-of-array-except-self"
          },
          {
            "id": 253,
            "title": "Meeting Rooms II",
            "title_slug": "meeting-rooms-ii"
          },
          {
            "id": 269,
            "title": "Alien Dictionary",
            "title_slug": "alien-dictionary"
          },
          {
            "id": 270,
            "title": "Closest Binary Search Tree Value",
            "title_slug": "closest-binary-search-tree-value"
          },
          {
            "id": 273,
            "title": "Integer to English Words",
            "title_slug": "integer-to-english-words"
          },
          {
            "id": 278,
            "title": "First Bad Version",
            "title_slug": "first-bad-version"
          },
          {
            "id": 282,
            "title": "Expression Add Operators",
            "title_slug": "expression-add-operators"
          },
          {
            "id": 297,
            "title": "Serialize and Deserialize Binary Tree",
            "title_slug": "serialize-and-deserialize-binary-tree"
          },
          {
            "id": 301,
            "title": "Remove Invalid Parentheses",
            "title_slug": "remove-invalid-parentheses"
          },
          {
            "id": 304,
            "title": "Range Sum Query 2D - Immutable",
            "title_slug": "range-sum-query-2d-immutable"
          },
          {
            "id": 340,
            "title": "Longest Substring with At Most K Distinct Characters",
            "title_slug": "longest-substring-with-at-most-k-distinct-characters"
          },
          {
            "id": 349,
            "title": "Intersection of Two Arrays",
            "title_slug": "intersection-of-two-arrays"
          },
          {
            "id": 415,
            "title": "Add Strings",
            "title_slug": "add-strings"
          },
          {
            "id": 438,
            "title": "Find All Anagrams in a String",
            "title_slug": "find-all-anagrams-in-a-string"
          },
          {
            "id": 523,
            "title": "Continuous Subarray Sum",
            "title_slug": "continuous-subarray-sum"
          },
          {
            "id": 543,
            "title": "Diameter of Binary Tree",
            "title_slug": "diameter-of-binary-tree"
          },
          {
            "id": 560,
            "title": "Subarray Sum Equals K",
            "title_slug": "subarray-sum-equals-k"
          },
          {
            "id": 621,
            "title": "Task Scheduler",
            "title_slug": "task-scheduler"
          },
          {
            "id": 636,
            "title": "Exclusive Time of Functions",
            "title_slug": "exclusive-time-of-functions"
          },
          {
            "id": 680,
            "title": "Valid Palindrome II",
            "title_slug": "valid-palindrome-ii"
          },
          {
            "id": 689,
            "title": "Maximum Sum of 3 Non-Overlapping Subarrays",
            "title_slug": "maximum-sum-of-3-non-overlapping-subarrays"
          },
          {
            "id": 758,
            "title": "Convert Binary Search Tree to Sorted Doubly Linked List",
            "title_slug": "convert-binary-search-tree-to-sorted-doubly-linked-list"
          },
          {
            "id": 778,
            "title": "Reorganize String",
            "title_slug": "reorganize-string"
          },
          {
            "id": 801,
            "title": "Is Graph Bipartite?",
            "title_slug": "is-graph-bipartite"
          },
          {
            "id": 852,
            "title": "Friends Of Appropriate Ages",
            "title_slug": "friends-of-appropriate-ages"
          },
          {
            "id": 893,
            "title": "All Nodes Distance K in Binary Tree",
            "title_slug": "all-nodes-distance-k-in-binary-tree"
          },
          {
            "id": 932,
            "title": "Monotonic Array",
            "title_slug": "monotonic-array"
          },
          {
            "id": 990,
            "title": "Verifying an Alien Dictionary",
            "title_slug": "verifying-an-alien-dictionary"
          },
          {
            "id": 1014,
            "title": "K Closest Points to Origin",
            "title_slug": "k-closest-points-to-origin"
          },
          {
            "id": 1028,
            "title": "Interval List Intersections",
            "title_slug": "interval-list-intersections"
          },
          {
            "id": 1029,
            "title": "Vertical Order Traversal of a Binary Tree",
            "title_slug": "vertical-order-traversal-of-a-binary-tree"
          },
          {
            "id": 1371,
            "title": "Minimum Remove to Make Valid Parentheses",
            "title_slug": "minimum-remove-to-make-valid-parentheses"
          }
        ],
        "is_public_favorite": true,
        "view_count": 5,
        "creator": "LeetCode",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "7p55wqm",
        "name": "Top Google Questions",
        "description": "",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          },
          {
            "id": 4,
            "title": "Median of Two Sorted Arrays",
            "title_slug": "median-of-two-sorted-arrays"
          },
          {
            "id": 68,
            "title": "Text Justification",
            "title_slug": "text-justification"
          },
          {
            "id": 200,
            "title": "Number of Islands",
            "title_slug": "number-of-islands"
          },
          {
            "id": 208,
            "title": "Implement Trie (Prefix Tree)",
            "title_slug": "implement-trie-prefix-tree"
          },
          {
            "id": 222,
            "title": "Count Complete Tree Nodes",
            "title_slug": "count-complete-tree-nodes"
          },
          {
            "id": 271,
            "title": "Encode and Decode Strings",
            "title_slug": "encode-and-decode-strings"
          },
          {
            "id": 299,
            "title": "Bulls and Cows",
            "title_slug": "bulls-and-cows"
          },
          {
            "id": 315,
            "title": "Count of Smaller Numbers After Self",
            "title_slug": "count-of-smaller-numbers-after-self"
          },
          {
            "id": 329,
            "title": "Longest Increasing Path in a Matrix",
            "title_slug": "longest-increasing-path-in-a-matrix"
          },
          {
            "id": 334,
            "title": "Increasing Triplet Subsequence",
            "title_slug": "increasing-triplet-subsequence"
          },
          {
            "id": 359,
            "title": "Logger Rate Limiter",
            "title_slug": "logger-rate-limiter"
          },
          {
            "id": 363,
            "title": "Max Sum of Rectangle No Larger Than K",
            "title_slug": "max-sum-of-rectangle-no-larger-than-k"
          },
          {
            "id": 410,
            "title": "Split Array Largest Sum",
            "title_slug": "split-array-largest-sum"
          },
          {
            "id": 465,
            "title": "Optimal Account Balancing",
            "title_slug": "optimal-account-balancing"
          },
          {
            "id": 482,
            "title": "License Key Formatting",
            "title_slug": "license-key-formatting"
          },
          {
            "id": 552,
            "title": "Student Attendance Record II",
            "title_slug": "student-attendance-record-ii"
          },
          {
            "id": 642,
            "title": "Design Search Autocomplete System",
            "title_slug": "design-search-autocomplete-system"
          },
          {
            "id": 659,
            "title": "Split Array into Consecutive Subsequences",
            "title_slug": "split-array-into-consecutive-subsequences"
          },
          {
            "id": 679,
            "title": "24 Game",
            "title_slug": "24-game"
          },
          {
            "id": 727,
            "title": "Minimum Window Subsequence",
            "title_slug": "minimum-window-subsequence"
          },
          {
            "id": 744,
            "title": "Network Delay Time",
            "title_slug": "network-delay-time"
          },
          {
            "id": 766,
            "title": "Flatten a Multilevel Doubly Linked List",
            "title_slug": "flatten-a-multilevel-doubly-linked-list"
          },
          {
            "id": 819,
            "title": "Minimum Swaps To Make Sequences Increasing",
            "title_slug": "minimum-swaps-to-make-sequences-increasing"
          },
          {
            "id": 827,
            "title": "Expressive Words",
            "title_slug": "expressive-words"
          },
          {
            "id": 865,
            "title": "Robot Room Cleaner",
            "title_slug": "robot-room-cleaner"
          },
          {
            "id": 873,
            "title": "Guess the Word",
            "title_slug": "guess-the-word"
          },
          {
            "id": 874,
            "title": "Backspace String Compare",
            "title_slug": "backspace-string-compare"
          },
          {
            "id": 876,
            "title": "Hand of Straights",
            "title_slug": "hand-of-straights"
          },
          {
            "id": 925,
            "title": "Construct Binary Tree from Preorder and Postorder Traversal",
            "title_slug": "construct-binary-tree-from-preorder-and-postorder-traversal"
          },
          {
            "id": 976,
            "title": "Minimum Area Rectangle",
            "title_slug": "minimum-area-rectangle"
          },
          {
            "id": 984,
            "title": "Most Stones Removed with Same Row or Column",
            "title_slug": "most-stones-removed-with-same-row-or-column"
          },
          {
            "id": 1023,
            "title": "Time Based Key-Value Store",
            "title_slug": "time-based-key-value-store"
          },
          {
            "id": 1049,
            "title": "Minimum Domino Rotations For Equal Row",
            "title_slug": "minimum-domino-rotations-for-equal-row"
          },
          {
            "id": 1051,
            "title": "Shortest Way to Form String",
            "title_slug": "shortest-way-to-form-string"
          },
          {
            "id": 1052,
            "title": "Campus Bikes",
            "title_slug": "campus-bikes"
          },
          {
            "id": 1056,
            "title": "Capacity To Ship Packages Within D Days",
            "title_slug": "capacity-to-ship-packages-within-d-days"
          },
          {
            "id": 1067,
            "title": "Campus Bikes II",
            "title_slug": "campus-bikes-ii"
          },
          {
            "id": 1076,
            "title": "Brace Expansion",
            "title_slug": "brace-expansion"
          },
          {
            "id": 1077,
            "title": "Confusing Number II",
            "title_slug": "confusing-number-ii"
          },
          {
            "id": 1124,
            "title": "String Transforms Into Another String",
            "title_slug": "string-transforms-into-another-string"
          },
          {
            "id": 1129,
            "title": "Longest String Chain",
            "title_slug": "longest-string-chain"
          },
          {
            "id": 1142,
            "title": "Minimum Knight Moves",
            "title_slug": "minimum-knight-moves"
          },
          {
            "id": 1188,
            "title": "Brace Expansion II",
            "title_slug": "brace-expansion-ii"
          },
          {
            "id": 1192,
            "title": "Divide Chocolate",
            "title_slug": "divide-chocolate"
          },
          {
            "id": 1207,
            "title": "Delete Nodes And Return Forest",
            "title_slug": "delete-nodes-and-return-forest"
          },
          {
            "id": 1248,
            "title": "Binary Tree Coloring Game",
            "title_slug": "binary-tree-coloring-game"
          },
          {
            "id": 1249,
            "title": "Snapshot Array",
            "title_slug": "snapshot-array"
          },
          {
            "id": 1273,
            "title": "Compare Strings by Frequency of the Smallest Character",
            "title_slug": "compare-strings-by-frequency-of-the-smallest-character"
          },
          {
            "id": 1331,
            "title": "Path with Maximum Gold",
            "title_slug": "path-with-maximum-gold"
          }
        ],
        "is_public_favorite": true,
        "view_count": 4,
        "creator": "LeetCode",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "wpwgkgt",
        "name": "Top Interview Questions",
        "description": "151",
        "questions": [
          {
            "id": 1,
            "title": "Two Sum",
            "title_slug": "two-sum"
          },
          {
            "id": 2,
            "title": "Add Two Numbers",
            "title_slug": "add-two-numbers"
          },
          {
            "id": 3,
            "title": "Longest Substring Without Repeating Characters",
            "title_slug": "longest-substring-without-repeating-characters"
          },
          {
            "id": 4,
            "title": "Median of Two Sorted Arrays",
            "title_slug": "median-of-two-sorted-arrays"
          },
          {
            "id": 5,
            "title": "Longest Palindromic Substring",
            "title_slug": "longest-palindromic-substring"
          },
          {
            "id": 7,
            "title": "Reverse Integer",
            "title_slug": "reverse-integer"
          },
          {
            "id": 8,
            "title": "String to Integer (atoi)",
            "title_slug": "string-to-integer-atoi"
          },
          {
            "id": 10,
            "title": "Regular Expression Matching",
            "title_slug": "regular-expression-matching"
          },
          {
            "id": 11,
            "title": "Container With Most Water",
            "title_slug": "container-with-most-water"
          },
          {
            "id": 13,
            "title": "Roman to Integer",
            "title_slug": "roman-to-integer"
          },
          {
            "id": 14,
            "title": "Longest Common Prefix",
            "title_slug": "longest-common-prefix"
          },
          {
            "id": 15,
            "title": "3Sum",
            "title_slug": "3sum"
          },
          {
            "id": 17,
            "title": "Letter Combinations of a Phone Number",
            "title_slug": "letter-combinations-of-a-phone-number"
          },
          {
            "id": 19,
            "title": "Remove Nth Node From End of List",
            "title_slug": "remove-nth-node-from-end-of-list"
          },
          {
            "id": 20,
            "title": "Valid Parentheses",
            "title_slug": "valid-parentheses"
          },
          {
            "id": 21,
            "title": "Merge Two Sorted Lists",
            "title_slug": "merge-two-sorted-lists"
          },
          {
            "id": 22,
            "title": "Generate Parentheses",
            "title_slug": "generate-parentheses"
          },
          {
            "id": 23,
            "title": "Merge k Sorted Lists",
            "title_slug": "merge-k-sorted-lists"
          },
          {
            "id": 26,
            "title": "Remove Duplicates from Sorted Array",
            "title_slug": "remove-duplicates-from-sorted-array"
          },
          {
            "id": 28,
            "title": "Implement strStr()",
            "title_slug": "implement-strstr"
          },
          {
            "id": 29,
            "title": "Divide Two Integers",
            "title_slug": "divide-two-integers"
          },
          {
            "id": 33,
            "title": "Search in Rotated Sorted Array",
            "title_slug": "search-in-rotated-sorted-array"
          },
          {
            "id": 34,
            "title": "Find First and Last Position of Element in Sorted Array",
            "title_slug": "find-first-and-last-position-of-element-in-sorted-array"
          },
          {
            "id": 36,
            "title": "Valid Sudoku",
            "title_slug": "valid-sudoku"
          },
          {
            "id": 38,
            "title": "Count and Say",
            "title_slug": "count-and-say"
          },
          {
            "id": 41,
            "title": "First Missing Positive",
            "title_slug": "first-missing-positive"
          },
          {
            "id": 42,
            "title": "Trapping Rain Water",
            "title_slug": "trapping-rain-water"
          },
          {
            "id": 44,
            "title": "Wildcard Matching",
            "title_slug": "wildcard-matching"
          },
          {
            "id": 46,
            "title": "Permutations",
            "title_slug": "permutations"
          },
          {
            "id": 48,
            "title": "Rotate Image",
            "title_slug": "rotate-image"
          },
          {
            "id": 49,
            "title": "Group Anagrams",
            "title_slug": "group-anagrams"
          },
          {
            "id": 50,
            "title": "Pow(x, n)",
            "title_slug": "powx-n"
          },
          {
            "id": 53,
            "title": "Maximum Subarray",
            "title_slug": "maximum-subarray"
          },
          {
            "id": 54,
            "title": "Spiral Matrix",
            "title_slug": "spiral-matrix"
          },
          {
            "id": 55,
            "title": "Jump Game",
            "title_slug": "jump-game"
          },
          {
            "id": 56,
            "title": "Merge Intervals",
            "title_slug": "merge-intervals"
          },
          {
            "id": 62,
            "title": "Unique Paths",
            "title_slug": "unique-paths"
          },
          {
            "id": 66,
            "title": "Plus One",
            "title_slug": "plus-one"
          },
          {
            "id": 69,
            "title": "Sqrt(x)",
            "title_slug": "sqrtx"
          },
          {
            "id": 70,
            "title": "Climbing Stairs",
            "title_slug": "climbing-stairs"
          },
          {
            "id": 73,
            "title": "Set Matrix Zeroes",
            "title_slug": "set-matrix-zeroes"
          },
          {
            "id": 75,
            "title": "Sort Colors",
            "title_slug": "sort-colors"
          },
          {
            "id": 76,
            "title": "Minimum Window Substring",
            "title_slug": "minimum-window-substring"
          },
          {
            "id": 78,
            "title": "Subsets",
            "title_slug": "subsets"
          },
          {
            "id": 79,
            "title": "Word Search",
            "title_slug": "word-search"
          },
          {
            "id": 84,
            "title": "Largest Rectangle in Histogram",
            "title_slug": "largest-rectangle-in-histogram"
          },
          {
            "id": 88,
            "title": "Merge Sorted Array",
            "title_slug": "merge-sorted-array"
          },
          {
            "id": 91,
            "title": "Decode Ways",
            "title_slug": "decode-ways"
          },
          {
            "id": 94,
            "title": "Binary Tree Inorder Traversal",
            "title_slug": "binary-tree-inorder-traversal"
          },
          {
            "id": 98,
            "title": "Validate Binary Search Tree",
            "title_slug": "validate-binary-search-tree"
          },
          {
            "id": 101,
            "title": "Symmetric Tree",
            "title_slug": "symmetric-tree"
          },
          {
            "id": 102,
            "title": "Binary Tree Level Order Traversal",
            "title_slug": "binary-tree-level-order-traversal"
          },
          {
            "id": 103,
            "title": "Binary Tree Zigzag Level Order Traversal",
            "title_slug": "binary-tree-zigzag-level-order-traversal"
          },
          {
            "id": 104,
            "title": "Maximum Depth of Binary Tree",
            "title_slug": "maximum-depth-of-binary-tree"
          },
          {
            "id": 105,
            "title": "Construct Binary Tree from Preorder and Inorder Traversal",
            "title_slug": "construct-binary-tree-from-preorder-and-inorder-traversal"
          },
          {
            "id": 108,
            "title": "Convert Sorted Array to Binary Search Tree",
            "title_slug": "convert-sorted-array-to-binary-search-tree"
          },
          {
            "id": 116,
            "title": "Populating Next Right Pointers in Each Node",
            "title_slug": "populating-next-right-pointers-in-each-node"
          },
          {
            "id": 118,
            "title": "Pascal's Triangle",
            "title_slug": "pascals-triangle"
          },
          {
            "id": 121,
            "title": "Best Time to Buy and Sell Stock",
            "title_slug": "best-time-to-buy-and-sell-stock"
          },
          {
            "id": 122,
            "title": "Best Time to Buy and Sell Stock II",
            "title_slug": "best-time-to-buy-and-sell-stock-ii"
          },
          {
            "id": 124,
            "title": "Binary Tree Maximum Path Sum",
            "title_slug": "binary-tree-maximum-path-sum"
          },
          {
            "id": 125,
            "title": "Valid Palindrome",
            "title_slug": "valid-palindrome"
          },
          {
            "id": 127,
            "title": "Word Ladder",
            "title_slug": "word-ladder"
          },
          {
            "id": 128,
            "title": "Longest Consecutive Sequence",
            "title_slug": "longest-consecutive-sequence"
          },
          {
            "id": 130,
            "title": "Surrounded Regions",
            "title_slug": "surrounded-regions"
          },
          {
            "id": 131,
            "title": "Palindrome Partitioning",
            "title_slug": "palindrome-partitioning"
          },
          {
            "id": 134,
            "title": "Gas Station",
            "title_slug": "gas-station"
          },
          {
            "id": 136,
            "title": "Single Number",
            "title_slug": "single-number"
          },
          {
            "id": 138,
            "title": "Copy List with Random Pointer",
            "title_slug": "copy-list-with-random-pointer"
          },
          {
            "id": 139,
            "title": "Word Break",
            "title_slug": "word-break"
          },
          {
            "id": 140,
            "title": "Word Break II",
            "title_slug": "word-break-ii"
          },
          {
            "id": 141,
            "title": "Linked List Cycle",
            "title_slug": "linked-list-cycle"
          },
          {
            "id": 146,
            "title": "LRU Cache",
            "title_slug": "lru-cache"
          },
          {
            "id": 148,
            "title": "Sort List",
            "title_slug": "sort-list"
          },
          {
            "id": 149,
            "title": "Max Points on a Line",
            "title_slug": "max-points-on-a-line"
          },
          {
            "id": 150,
            "title": "Evaluate Reverse Polish Notation",
            "title_slug": "evaluate-reverse-polish-notation"
          },
          {
            "id": 152,
            "title": "Maximum Product Subarray",
            "title_slug": "maximum-product-subarray"
          },
          {
            "id": 155,
            "title": "Min Stack",
            "title_slug": "min-stack"
          },
          {
            "id": 160,
            "title": "Intersection of Two Linked Lists",
            "title_slug": "intersection-of-two-linked-lists"
          },
          {
            "id": 162,
            "title": "Find Peak Element",
            "title_slug": "find-peak-element"
          },
          {
            "id": 163,
            "title": "Missing Ranges",
            "title_slug": "missing-ranges"
          },
          {
            "id": 166,
            "title": "Fraction to Recurring Decimal",
            "title_slug": "fraction-to-recurring-decimal"
          },
          {
            "id": 169,
            "title": "Majority Element",
            "title_slug": "majority-element"
          },
          {
            "id": 171,
            "title": "Excel Sheet Column Number",
            "title_slug": "excel-sheet-column-number"
          },
          {
            "id": 172,
            "title": "Factorial Trailing Zeroes",
            "title_slug": "factorial-trailing-zeroes"
          },
          {
            "id": 179,
            "title": "Largest Number",
            "title_slug": "largest-number"
          },
          {
            "id": 189,
            "title": "Rotate Array",
            "title_slug": "rotate-array"
          },
          {
            "id": 190,
            "title": "Reverse Bits",
            "title_slug": "reverse-bits"
          },
          {
            "id": 191,
            "title": "Number of 1 Bits",
            "title_slug": "number-of-1-bits"
          },
          {
            "id": 198,
            "title": "House Robber",
            "title_slug": "house-robber"
          },
          {
            "id": 200,
            "title": "Number of Islands",
            "title_slug": "number-of-islands"
          },
          {
            "id": 202,
            "title": "Happy Number",
            "title_slug": "happy-number"
          },
          {
            "id": 204,
            "title": "Count Primes",
            "title_slug": "count-primes"
          },
          {
            "id": 206,
            "title": "Reverse Linked List",
            "title_slug": "reverse-linked-list"
          },
          {
            "id": 207,
            "title": "Course Schedule",
            "title_slug": "course-schedule"
          },
          {
            "id": 208,
            "title": "Implement Trie (Prefix Tree)",
            "title_slug": "implement-trie-prefix-tree"
          },
          {
            "id": 210,
            "title": "Course Schedule II",
            "title_slug": "course-schedule-ii"
          },
          {
            "id": 212,
            "title": "Word Search II",
            "title_slug": "word-search-ii"
          },
          {
            "id": 215,
            "title": "Kth Largest Element in an Array",
            "title_slug": "kth-largest-element-in-an-array"
          },
          {
            "id": 217,
            "title": "Contains Duplicate",
            "title_slug": "contains-duplicate"
          },
          {
            "id": 218,
            "title": "The Skyline Problem",
            "title_slug": "the-skyline-problem"
          },
          {
            "id": 227,
            "title": "Basic Calculator II",
            "title_slug": "basic-calculator-ii"
          },
          {
            "id": 230,
            "title": "Kth Smallest Element in a BST",
            "title_slug": "kth-smallest-element-in-a-bst"
          },
          {
            "id": 234,
            "title": "Palindrome Linked List",
            "title_slug": "palindrome-linked-list"
          },
          {
            "id": 236,
            "title": "Lowest Common Ancestor of a Binary Tree",
            "title_slug": "lowest-common-ancestor-of-a-binary-tree"
          },
          {
            "id": 237,
            "title": "Delete Node in a Linked List",
            "title_slug": "delete-node-in-a-linked-list"
          },
          {
            "id": 238,
            "title": "Product of Array Except Self",
            "title_slug": "product-of-array-except-self"
          },
          {
            "id": 239,
            "title": "Sliding Window Maximum",
            "title_slug": "sliding-window-maximum"
          },
          {
            "id": 240,
            "title": "Search a 2D Matrix II",
            "title_slug": "search-a-2d-matrix-ii"
          },
          {
            "id": 242,
            "title": "Valid Anagram",
            "title_slug": "valid-anagram"
          },
          {
            "id": 251,
            "title": "Flatten 2D Vector",
            "title_slug": "flatten-2d-vector"
          },
          {
            "id": 253,
            "title": "Meeting Rooms II",
            "title_slug": "meeting-rooms-ii"
          },
          {
            "id": 268,
            "title": "Missing Number",
            "title_slug": "missing-number"
          },
          {
            "id": 269,
            "title": "Alien Dictionary",
            "title_slug": "alien-dictionary"
          },
          {
            "id": 277,
            "title": "Find the Celebrity",
            "title_slug": "find-the-celebrity"
          },
          {
            "id": 279,
            "title": "Perfect Squares",
            "title_slug": "perfect-squares"
          },
          {
            "id": 283,
            "title": "Move Zeroes",
            "title_slug": "move-zeroes"
          },
          {
            "id": 285,
            "title": "Inorder Successor in BST",
            "title_slug": "inorder-successor-in-bst"
          },
          {
            "id": 287,
            "title": "Find the Duplicate Number",
            "title_slug": "find-the-duplicate-number"
          },
          {
            "id": 289,
            "title": "Game of Life",
            "title_slug": "game-of-life"
          },
          {
            "id": 295,
            "title": "Find Median from Data Stream",
            "title_slug": "find-median-from-data-stream"
          },
          {
            "id": 297,
            "title": "Serialize and Deserialize Binary Tree",
            "title_slug": "serialize-and-deserialize-binary-tree"
          },
          {
            "id": 300,
            "title": "Longest Increasing Subsequence",
            "title_slug": "longest-increasing-subsequence"
          },
          {
            "id": 308,
            "title": "Range Sum Query 2D - Mutable",
            "title_slug": "range-sum-query-2d-mutable"
          },
          {
            "id": 315,
            "title": "Count of Smaller Numbers After Self",
            "title_slug": "count-of-smaller-numbers-after-self"
          },
          {
            "id": 322,
            "title": "Coin Change",
            "title_slug": "coin-change"
          },
          {
            "id": 324,
            "title": "Wiggle Sort II",
            "title_slug": "wiggle-sort-ii"
          },
          {
            "id": 326,
            "title": "Power of Three",
            "title_slug": "power-of-three"
          },
          {
            "id": 328,
            "title": "Odd Even Linked List",
            "title_slug": "odd-even-linked-list"
          },
          {
            "id": 329,
            "title": "Longest Increasing Path in a Matrix",
            "title_slug": "longest-increasing-path-in-a-matrix"
          },
          {
            "id": 334,
            "title": "Increasing Triplet Subsequence",
            "title_slug": "increasing-triplet-subsequence"
          },
          {
            "id": 340,
            "title": "Longest Substring with At Most K Distinct Characters",
            "title_slug": "longest-substring-with-at-most-k-distinct-characters"
          },
          {
            "id": 341,
            "title": "Flatten Nested List Iterator",
            "title_slug": "flatten-nested-list-iterator"
          },
          {
            "id": 344,
            "title": "Reverse String",
            "title_slug": "reverse-string"
          },
          {
            "id": 347,
            "title": "Top K Frequent Elements",
            "title_slug": "top-k-frequent-elements"
          },
          {
            "id": 348,
            "title": "Design Tic-Tac-Toe",
            "title_slug": "design-tic-tac-toe"
          },
          {
            "id": 350,
            "title": "Intersection of Two Arrays II",
            "title_slug": "intersection-of-two-arrays-ii"
          },
          {
            "id": 371,
            "title": "Sum of Two Integers",
            "title_slug": "sum-of-two-integers"
          },
          {
            "id": 378,
            "title": "Kth Smallest Element in a Sorted Matrix",
            "title_slug": "kth-smallest-element-in-a-sorted-matrix"
          },
          {
            "id": 380,
            "title": "Insert Delete GetRandom O(1)",
            "title_slug": "insert-delete-getrandom-o1"
          },
          {
            "id": 384,
            "title": "Shuffle an Array",
            "title_slug": "shuffle-an-array"
          },
          {
            "id": 387,
            "title": "First Unique Character in a String",
            "title_slug": "first-unique-character-in-a-string"
          },
          {
            "id": 395,
            "title": "Longest Substring with At Least K Repeating Characters",
            "title_slug": "longest-substring-with-at-least-k-repeating-characters"
          },
          {
            "id": 412,
            "title": "Fizz Buzz",
            "title_slug": "fizz-buzz"
          },
          {
            "id": 454,
            "title": "4Sum II",
            "title_slug": "4sum-ii"
          }
        ],
        "is_public_favorite": true,
        "view_count": 3,
        "creator": "LeetCode",
        "current_user": "",
        "is_watched": false
      },
      {
        "id_hash": "7p5ept7",
        "name": "Top LinkedIn Questions",
        "description": "",
        "questions": [
          {
            "id": 53,
            "title": "Maximum Subarray",
            "title_slug": "maximum-subarray"
          },
          {
            "id": 57,
            "title": "Insert Interval",
            "title_slug": "insert-interval"
          },
          {
            "id": 76,
            "title": "Minimum Window Substring",
            "title_slug": "minimum-window-substring"
          },
          {
            "id": 88,
            "title": "Merge Sorted Array",
            "title_slug": "merge-sorted-array"
          },
          {
            "id": 149,
            "title": "Max Points on a Line",
            "title_slug": "max-points-on-a-line"
          },
          {
            "id": 150,
            "title": "Evaluate Reverse Polish Notation",
            "title_slug": "evaluate-reverse-polish-notation"
          },
          {
            "id": 152,
            "title": "Maximum Product Subarray",
            "title_slug": "maximum-product-subarray"
          },
          {
            "id": 215,
            "title": "Kth Largest Element in an Array",
            "title_slug": "kth-largest-element-in-an-array"
          },
          {
            "id": 235,
            "title": "Lowest Common Ancestor of a Binary Search Tree",
            "title_slug": "lowest-common-ancestor-of-a-binary-search-tree"
          },
          {
            "id": 243,
            "title": "Shortest Word Distance",
            "title_slug": "shortest-word-distance"
          },
          {
            "id": 244,
            "title": "Shortest Word Distance II",
            "title_slug": "shortest-word-distance-ii"
          },
          {
            "id": 256,
            "title": "Paint House",
            "title_slug": "paint-house"
          },
          {
            "id": 272,
            "title": "Closest Binary Search Tree Value II",
            "title_slug": "closest-binary-search-tree-value-ii"
          },
          {
            "id": 297,
            "title": "Serialize and Deserialize Binary Tree",
            "title_slug": "serialize-and-deserialize-binary-tree"
          },
          {
            "id": 364,
            "title": "Nested List Weight Sum II",
            "title_slug": "nested-list-weight-sum-ii"
          },
          {
            "id": 366,
            "title": "Find Leaves of Binary Tree",
            "title_slug": "find-leaves-of-binary-tree"
          },
          {
            "id": 373,
            "title": "Find K Pairs with Smallest Sums",
            "title_slug": "find-k-pairs-with-smallest-sums"
          },
          {
            "id": 432,
            "title": "All O`one Data Structure",
            "title_slug": "all-oone-data-structure"
          },
          {
            "id": 605,
            "title": "Can Place Flowers",
            "title_slug": "can-place-flowers"
          },
          {
            "id": 716,
            "title": "Max Stack",
            "title_slug": "max-stack"
          }
        ],
        "is_public_favorite": true,
        "view_count": 5,
        "creator": "LeetCode",
        "current_user": "",
        "is_watched": false
      }
    ]
    }
    }
    """
}
