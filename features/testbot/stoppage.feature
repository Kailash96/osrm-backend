@routing @maxspeed @testbot
Feature: Testbot - Acceleration profiles

    Background: Use specific speeds
        Given the profile "testbot"
        Given a grid size of 1000 meters

    Scenario: Testbot - Use stoppage penalty at waypoints
        Given the node map
            """
            a 1 2 3 4 5 b
            """

        And the ways
            | nodes | highway | maxspeed:forward    | maxspeed:backward |
            | ab    | trunk   | 60                  | 45                |

        And the query options
            | stoppage_penalty | 5,100   |

        When I route I should get
            | from | to | route | time   |
            | a    | b  | ab,ab | 475.8s |

        When I request a travel time matrix I should get
            |   | a     | b     |
            | a | 0     | 449.0 |
            | b | 449.0 | 0     |