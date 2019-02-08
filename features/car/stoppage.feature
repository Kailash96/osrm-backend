@routing @maxspeed @car
Feature: Car - Acceleration profiles

    Background: Use specific speeds
        Given the profile "car"
        Given a grid size of 1000 meters

    Scenario: Car - Respect maxspeeds when lower than way type speed
        Given the node map
            """
            a 1 2 3 4 5 b
            """

        And the ways
            | nodes | highway | maxspeed    |
            | ab    | trunk   | 60          |

        And the query options
            | stoppage_penalty | 5,100   |

        When I route I should get
            | from | to | route | time   |
            | a    | b  | ab,ab | 449.9s |