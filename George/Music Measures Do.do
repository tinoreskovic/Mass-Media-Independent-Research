clear all 
set obs 594
gen title = ""
gen artist = ""
gen rank=.
gen words=.
gen month=.


replace title = "Hot Boyz" in 1
replace artist = "Missy 'Misdemeanor' Elliott" in 1
replace rank = 7 in 1
replace month = 1 in 1

replace title = "Hot Boyz" in 2
replace artist = "Missy 'Misdemeanor' Elliott" in 2
replace rank = 8 in 2
replace month = 2 in 2

replace title = "Hot Boyz" in 3
replace artist = "Missy 'Misdemeanor' Elliott" in 3
replace rank = 11 in 3
replace month = 3 in 3

replace title = "Wobble Wobble" in 4
replace artist = "504 Boyz" in 4
replace rank = 17 in 4
replace month = 5 in 4

replace title = "The Real Slim Shady" in 5
replace artist = "Eminem" in 5
replace rank = 11 in 5
replace month = 6 in 5

replace title = "The Real Slim Shady" in 6
replace artist = "Eminem" in 6
replace rank = 5 in 6
replace month = 7 in 6

replace title = "Hot Shit" in 7
replace artist = "Nelly" in 7
replace rank = 17 in 7
replace month = 8 in 7

replace title = "Hot Shit" in 8
replace artist = "Nelly" in 8
replace rank = 11 in 8
replace month = 9 in 8

replace title = "Hot Shit" in 9
replace artist = "Nelly" in 9
replace rank = 10 in 9
replace month = 10 in 9

replace title = "Shake Ya Ass" in 10
replace artist = "Mystikal" in 10
replace rank = 15 in 10
replace month = 10 in 10

replace title = "Bounce With Me" in 11
replace artist = "Lil Bow Wow" in 11
replace rank = 20 in 11
replace month = 10 in 11

replace title = "Shake Ya Ass" in 12
replace artist = "Mystikal" in 12
replace rank = 13 in 12
replace month = 11 in 12

replace title = "Between Me and You" in 13
replace artist = "Ja Rule" in 13
replace rank = 16 in 13
replace month = 11 in 13

replace title = "Hot Shit" in 14
replace artist = "Nelly" in 14
replace rank = 17 in 14
replace month = 11 in 14

replace title = "It Wasn't Me" in 15
replace artist = "Shaggy" in 15
replace rank = 10 in 15
replace month = 12 in 15

replace title = "Between Me and You" in 16
replace artist = "Ja Rule" in 16
replace rank = 14 in 16
replace month = 12 in 16

replace title = "E.I." in 17
replace artist = "Nelly" in 17
replace rank = 16 in 17
replace month = 12 in 17

replace title = "I Just Wanna Love U (Give It To Me)" in 17
replace artist = "Jay-Z" in 17
replace rank = 19 in 17
replace month = 12 in 17

replace title = "It Wasn't Me" in 18
replace artist = "Shaggy" in 18
replace rank = 3 in 18
replace month = 13 in 18

replace title = "Ms. Jackson" in 19
replace artist = "OutKast" in 19
replace rank = 6 in 19
replace month = 13 in 19

replace title = "I Just Wanna Love U (Give It To Me)" in 20
replace artist = "Jay-Z" in 20
replace rank = 12 in 20
replace month = 13 in 20

replace title = "E.I." in 21
replace artist = "Nelly" in 21
replace rank = 19 in 21
replace month = 13 in 21

replace title = "It Wasn't Me" in 22
replace artist = "Shaggy" in 22
replace rank = 1 in 22
replace month = 14 in 22

replace title = "Ms. Jackson" in 23
replace artist = "OutKast" in 23
replace rank = 3 in 23
replace month = 14 in 23

replace title = "Put It On Me" in 24
replace artist = "Ja Rule" in 24
replace rank = 13 in 24
replace month = 14 in 24

replace title = "I Just Wanna Love U (Give It To Me)" in 25
replace artist = "Jay-Z" in 25
replace rank = 15 in 25
replace month = 14 in 25

replace title = "Danger (Been So Long)" in 26
replace artist = "Mystikal" in 26
replace rank = 17 in 26
replace month = 14 in 26

replace title = "Angel" in 27
replace artist = "Shaggy" in 27
replace rank = 19 in 27
replace month = 14 in 27

replace title = "It Wasn't Me" in 28
replace artist = "Shaggy" in 28
replace rank = 2 in 28
replace month = 15 in 28

replace title = "Angel" in 29
replace artist = "Shaggy" in 29
replace rank = 5 in 29
replace month = 15 in 29

replace title = "Ms. Jackson" in 30
replace artist = "OutKast" in 30
replace rank = 7 in 30
replace month = 15 in 30

replace title = "Put It On Me" in 31
replace artist = "Ja Rule" in 31
replace rank = 9 in 31
replace month = 15 in 31

replace title = "Butterfly" in 32
replace artist = "Crazy Town" in 32
replace rank = 11 in 32
replace month = 15 in 32

replace title = "Danger (Been So Long)" in 33
replace artist = "Mystikal" in 33
replace rank = 19 in 33
replace month = 15 in 33

replace title = "Butterfly" in 34
replace artist = "Crazy Town" in 34
replace rank = 1 in 34
replace month = 16 in 34

replace title = "Angel" in 35
replace artist = "Shaggy" in 35
replace rank = 3 in 35
replace month = 16 in 35

replace title = "Put It On Me" in 36
replace artist = "Ja Rule" in 36
replace rank = 10 in 36
replace month = 16 in 36

replace title = "Ride Wit Me" in 37
replace artist = "Nelly" in 37
replace rank = 17 in 37
replace month = 16 in 37

replace title = "Ride Wit Me" in 38
replace artist = "Nelly" in 38
replace rank = 5 in 38
replace month = 17 in 38

replace title = "Angel" in 39
replace artist = "Shaggy" in 39
replace rank = 7 in 39
replace month = 17 in 39

replace title = "Butterfly" in 40
replace artist = "Crazy Town" in 40
replace rank = 11 in 40
replace month = 17 in 40

replace title = "Put It On Me" in 41
replace artist = "Ja Rule" in 41
replace rank = 18 in 41
replace month = 17 in 41

replace title = "Ride Wit Me" in 42
replace artist = "Nelly" in 42
replace rank = 5 in 42
replace month = 18 in 42

replace title = "Get Ur Freak On" in 43
replace artist = "Missy 'Misdemeanor Elliott" in 43
replace rank = 9 in 43
replace month = 18 in 43

replace title = "My Baby" in 44
replace artist = "Lil' Romeo" in 44
replace rank = 11 in 44
replace month = 18 in 44

replace title = "Peaches & Cream" in 45
replace artist = "112" in 45
replace rank = 13 in 45
replace month = 18 in 45

replace title = "Angel" in 46
replace artist = "Shaggy" in 46
replace rank = 19 in 46
replace month = 18 in 46

replace title = "Peaches & Cream" in 47
replace artist = "112" in 47
replace rank = 4 in 47
replace month = 19 in 47

replace title = "Ride Wit Me" in 48
replace artist = "Nelly" in 48
replace rank = 7 in 48
replace month = 19 in 48

replace title = "My Baby" in 49
replace artist = "Lil' Romeo" in 49
replace rank = 9 in 49
replace month = 19 in 49

replace title = "Peaches & Cream" in 50
replace artist = "112" in 50
replace rank = 9 in 50
replace month = 20 in 50

replace title = "Where The Party At" in 51
replace artist = "Jagged Edge" in 51
replace rank = 11 in 51
replace month = 20 in 51

replace title = "Purple Hills" in 52
replace artist = "D12" in 52
replace rank = 19 in 52
replace month = 20 in 52

replace title = "Get Ur Freak On" in 53
replace artist = "Missy 'Misdemeanor' Elliott" in 53
replace rank = 20 in 53
replace month = 20 in 53

replace title = "Where The Party At" in 54
replace artist = "Jagged Edge" in 54
replace rank = 6 in 54
replace month = 21 in 54

replace title = "Peaches & Cream" in 55
replace artist = "112" in 55
replace rank = 11 in 55
replace month = 21 in 55

replace title = "Izzo (H.O.V.A.)" in 56
replace artist = "Jay-Z" in 56
replace rank = 14 in 56
replace month = 21 in 56

replace title = "One Minute Man" in 57
replace artist = "Missy 'Misdemeanor' Elliott" in 57
replace rank = 17 in 57
replace month = 21 in 57

replace title = "Because I Got High" in 58
replace artist = "Afroman" in 58
replace rank = 20 in 58
replace month = 21 in 58

replace title = "I'm Real" in 59
replace artist = "Jennifer Lopez" in 59
replace rank = 2 in 59
replace month = 22 in 59

replace title = "Where The Party At" in 60
replace artist = "Jagged Edge" in 60
replace rank = 3 in 60
replace month = 22 in 60

replace title = "Izzo (H.O.V.A.)" in 61
replace artist = "Jay-Z" in 61
replace rank = 9 in 61
replace month = 22 in 61

replace title = "One Minute Man" in 62
replace artist = "Missy 'Misdemeanor' Elliott" in 62
replace rank = 15 in 62
replace month = 22 in 62

replace title = "I'm A Thug" in 63
replace artist = "Trick Daddy" in 63
replace rank = 17 in 63
replace month = 22 in 63

replace title = "Livin' It Up" in 64
replace artist = "Ja Rule" in 64
replace rank = 19 in 64
replace month = 22 in 64

replace title = "Peaches & Cream" in 65
replace artist = "112" in 65
replace rank = 21 in 65
replace month = 22 in 65

replace title = "I'm Real" in 66
replace artist = "Jennifer Lopez" in 66
replace rank = 2 in 66
replace month = 23 in 66

replace title = "Livin' It Up" in 67
replace artist = "Ja Rule" in 67
replace rank = 9 in 67
replace month = 23 in 67

replace title = "Where The Party At" in 68
replace artist = "Jagged Edge" in 68
replace rank = 10 in 68
replace month = 23 in 68

replace title = "Izzo (H.O.V.A.)" in 69
replace artist = "Jay-Z" in 69
replace rank = 14 in 69
replace month = 23 in 69

replace title = "Ugly" in 70
replace artist = "Bubba Sparxxx" in 70
replace rank = 15 in 70
replace month = 23 in 70

replace title = "I'm Real" in 71
replace artist = "Jennifer Lopez" in 71
replace rank = 6 in 71
replace month = 24 in 71

replace title = "Livin' It Up" in 72
replace artist = "Ja Rule" in 72
replace rank = 8 in 72
replace month = 24 in 72

replace title = "Girls, Girls, Girls" in 73
replace artist = "Jay-Z" in 73
replace rank = 17 in 73
replace month = 24 in 73

replace title = "I Do!" in 74
replace artist = "Toya" in 74
replace rank = 18 in 74
replace month = 24 in 74

replace title = "Always On Time" in 75
replace artist = "Ja Rule" in 75
replace rank = 5 in 75
replace month = 25 in 75

replace title = "Livin' It Up" in 76
replace artist = "Ja Rule" in 76
replace rank = 11 in 76
replace month = 25 in 76

replace title = "In The End" in 77
replace artist = "Linkin Park" in 77
replace rank = 15 in 77
replace month = 25 in 77

replace title = "I Do!" in 78
replace artist = "Toya" in 78
replace rank = 16 in 78
replace month = 25 in 78

replace title = "We Thuggin'" in 79
replace artist = "Fat Joe" in 79
replace rank = 18 in 79
replace month = 25 in 79

replace title = "Always On Time" in 80
replace artist = "Ja Rule" in 80
replace rank = 3 in 80
replace month = 26 in 80

replace title = "In The End" in 81
replace artist = "Linkin Park" in 81
replace rank = 7 in 81
replace month = 26 in 81

replace title = "Ain't It Funny" in 82
replace artist = "Jennifer Lopez" in 82
replace rank = 12 in 82
replace month = 26 in 82

replace title = "Roll Out (My Business)" in 83
replace artist = "Ludacris" in 83
replace rank = 17 in 83
replace month = 26 in 83

replace title = "Livin' It Up" in 84
replace artist = "Ja Rule" in 84
replace rank = 19 in 84
replace month = 26 in 84

replace title = "Always On Time" in 85
replace artist = "Ja Rule" in 85
replace rank = 1 in 85
replace month = 27 in 85

replace title = "Ain't It Funny" in 86
replace artist = "Jennifer Lopez" in 86
replace rank = 3 in 86
replace month = 27 in 86

replace title = "In The End" in 87
replace artist = "Linkin Park" in 87
replace rank = 4 in 87
replace month = 27 in 87

replace title = "Lights, Camera, Action!" in 88
replace artist = "Mr. Cheeks" in 88
replace rank = 16 in 88
replace month = 27 in 88

replace title = "The Whole World" in 89
replace artist = "Outkast" in 89
replace rank = 19 in 89
replace month = 27 in 89

replace title = "Ain't It Funny" in 90
replace artist = "WJennifer Lopez" in 90
replace rank = 1 in 90
replace month = 28 in 90

replace title = "What's Luv?" in 91
replace artist = "Fat Joe" in 91
replace rank = 2 in 91
replace month = 28 in 91

replace title = "In The End" in 92
replace artist = "Linkin Park" in 92
replace rank = 3  in 92
replace month = 28 in 92

replace title = "Always On Time" in 93
replace artist = "Ja Rule" in 93
replace rank = 9 in 93
replace month = 28 in 93

replace title = "What's Luv?" in 94
replace artist = "Fat Joe" in 94
replace rank = 2 in 94
replace month = 29 in 94

replace title = "I Need A Girl (Part One)" in 95
replace artist = "P. Diddy" in 95
replace rank = 4 in 95
replace month = 29 in 95

replace title = "Ain't It Funny" in 96
replace artist = "Jennifer Lopez" in 96
replace rank = 5 in 96
replace month = 29 in 96

replace title = "In The End" in 97
replace artist = "Linkin Park" in 97
replace rank = 11 in 97
replace month = 29 in 97

replace title = "Pass The Courvoisier Part II" in 98
replace artist = "Busta Rhymes" in 98
replace rank = 16 in 98
replace month = 29 in 98

replace title = "Rainy Dayz" in 99
replace artist = "Mary J. Blige" in 99
replace rank = 18 in 99
replace month = 29 in 99

replace title = "I Need A Girl (Part One)" in 100
replace artist = "P. Diddy" in 100
replace rank = 2 in 100
replace month = 30 in 100

replace title = "What's Luv?" in 101
replace artist = "Fat Joe" in 101
replace rank = 3 in 101
replace month = 30 in 101

replace title = "Without Me" in 102
replace artist = "Eminem" in 102
replace rank = 6 in 102
replace month = 30 in 102

replace title = "Hot In Herre" in 103
replace artist = "Nelly" in 103
replace rank = 7 in 103
replace month = 30 in 103

replace title = "Rainy Dayz" in 104
replace artist = "Mary J. Blige" in 104
replace rank = 12 in 104
replace month = 30 in 104

replace title = "I'm Gonna Be Alright" in 105
replace artist = "Jennifer Lopez" in 105
replace rank = 18 in 105
replace month = 30 in 105

replace title = "Pass The Courvoisier Part II" in 106
replace artist = "Busta Rhymes" in 106
replace rank = 19 in 106
replace month = 30 in 106

replace title = "Hot In Herre" in 107
replace artist = "Nelly" in 107
replace rank = 1 in 107
replace month = 31 in 107

replace title = "Without Me" in 108
replace artist = "Eminem" in 108
replace rank = 2 in 108
replace month = 31 in 108

replace title = "I Need A Girl (Part One)" in 109
replace artist = "P.Diddy" in 109
replace rank = 7 in 109
replace month = 31 in 109

replace title = "I'm Gonna Be Alright" in 110
replace artist = "Jennifer Lopez" in 110
replace rank = 10 in 110
replace month = 31 in 110

replace title = "Still Fly" in 111
replace artist = "Big Tymers" in 111
replace rank = 12 in 111
replace month = 31 in 111

replace title = "I Need A Girl (Part Two)" in 112
replace artist = "P. Diddy & Ginuwine" in 112
replace rank = 13 in 112
replace month = 31 in 112

replace title = "What's Luv?" in 113
replace artist = "Fat Joe" in 113
replace rank = 15 in 113
replace month = 31 in 113

replace title = "Hot In Herre" in 114
replace artist = "Nelly" in 114
replace rank = 1 in 114
replace month = 32 in 114

replace title = "Dilemma" in 115
replace artist = "Nelly" in 115
replace rank = 3 in 115
replace month = 32 in 115

replace title = "I Need A Girl (Part Two)" in 116
replace artist = "P. Diddy & Ginuwine" in 116
replace rank = 4 in 116
replace month = 32 in 116

replace title = "Without Me" in 117
replace artist = "Eminem" in 117
replace rank = 6 in 117
replace month = 32 in 117

replace title = "Down 4 U" in 118
replace artist = "Irv Gotti Presents The Inc." in 118
replace rank = 8 in 118
replace month = 32 in 118

replace title = "I'm Gonna Be Alright" in 119
replace artist = "Jennifer Lopez" in 119
replace rank = 10 in 119
replace month = 32 in 119

replace title = "Still Fly" in 120
replace artist = "Big Tymers" in 120
replace rank = 14 in 120
replace month = 32 in 120

replace title = "Nothin'" in 121
replace artist = "N.O.R.E." in 121
replace rank = 19 in 121
replace month = 32 in 121

replace title = "Dilemma" in 122
replace artist = "Nelly" in 122
replace rank = 1 in 122
replace month = 33 in 122

replace title = "Hot In Herre" in 123
replace artist = "Nelly" in 123
replace rank = 3 in 123
replace month = 33 in 123

replace title = "Gangsta Lovin'" in 124
replace artist = "Eve" in 124
replace rank = 4 in 124
replace month = 33 in 124

replace title = "I Need A Girl (Part Two)" in 125
replace artist = "P. Diddy & Ginuwine" in 125
replace rank = 5 in 125
replace month = 33 in 125

replace title = "Cleanin' Out My Closet" in 126
replace artist = "Eminem" in 126
replace rank = 7 in 126
replace month = 33 in 126

replace title = "Nothin'" in 127
replace artist = "N.O.R.E." in 127
replace rank = 10 in 127
replace month = 33 in 127

replace title = "Down 4 U" in 128
replace artist = "Irv Gotti Presents The Inc." in 128
replace rank = 11 in 128
replace month = 33 in 128

replace title = "Move Bitch" in 129
replace artist = "Ludacris" in 129
replace rank = 12 in 129
replace month = 33 in 129

replace title = "I'm Gonna Be Alright" in 130
replace artist = "Jennifer Lopez" in 130
replace rank = 21 in 130
replace month = 33 in 130

replace title = "Dilemma" in 131
replace artist = "Nelly" in 131
replace rank = 2 in 131
replace month = 34 in 131

replace title = "Gangsta Lovin'" in 132
replace artist = "Eve" in 132
replace rank = 3 in 132
replace month = 34 in 132

replace title = "Cleanin' Out My Closet" in 133
replace artist = "Eminem" in 133
replace rank = 5 in 133
replace month = 34 in 133

replace title = "I Need A Girl (Part Two)" in 134
replace artist = "P. Diddy & Ginuwine" in 134
replace rank = 7 in 134
replace month = 34 in 134

replace title = "Hey Ma" in 135
replace artist = "Cam'ron" in 135
replace rank = 8 in 135
replace month = 34 in 135

replace title = "Move Bitch" in 136
replace artist = "Ludacris" in 136
replace rank = 10 in 136
replace month = 34 in 136

replace title = "Work It" in 137
replace artist = "Missy 'Misdemeanor' Elliott" in 137
replace rank = 11 in 137
replace month = 34 in 137

replace title = "Hot In Herre" in 138
replace artist = "Nelly" in 138
replace rank = 12 in 138
replace month = 34 in 138

replace title = "If I Could Go!" in 139
replace artist = "Angie Martinez" in 139
replace rank = 15 in 139
replace month = 34 in 139

replace title = "Nothin'" in 140
replace artist = "N.O.R.E." in 140
replace rank = 16 in 140
replace month = 34 in 140

replace title = "Trade It All" in 141
replace artist = "Fabolous" in 141
replace rank = 20 in 141
replace month = 34 in 141

replace title = "Dilemma" in 142
replace artist = "Nelly" in 142
replace rank = 1 in 142
replace month = 35 in 142

replace title = "Lose Yourself" in 143
replace artist = "Eminem" in 143
replace rank = 2 in 143
replace month = 35 in 143

replace title = "Hey Ma" in 144
replace artist = "Cam'ron" in 144
replace rank = 3 in 144
replace month = 35 in 144

replace title = "Work It" in 145
replace artist = "Missy 'Misdemeanor' Elliott" in 145
replace rank = 4 in 145
replace month = 35 in 145

replace title = "Gangsta Lovin'" in 146
replace artist = "Eve" in 146
replace rank = 6 in 146
replace month = 35 in 146

replace title = "Luv U Better" in 147
replace artist = "LL Cool J" in 147
replace rank = 7 in 147
replace month = 35 in 147

replace title = "Gimme The Light" in 148
replace artist = "Sean Paul" in 148
replace rank = 13 in 148
replace month = 35 in 148

replace title = "Jenny From The Block" in 149
replace artist = "Jennifer Lopez" in 149
replace rank = 16 in 149
replace month = 35 in 149

replace title = "If I Could Go!" in 150
replace artist = "Angie Martinez" in 150
replace rank = 19 in 150
replace month = 35 in 150

replace title = "Lose Yourself" in 151
replace artist = "Eminem" in 151
replace rank = 1 in 151
replace month = 36 in 151

replace title = "Work It" in 152
replace artist = "Miss 'Misdemeanor' Elliott" in 152
replace rank = 2 in 152
replace month = 36 in 152

replace title = "Jenny From The Block" in 153
replace artist = "Jennifer Lopez" in 153
replace rank = 3 in 153
replace month = 36 in 153

replace title = "Luv U Better" in 154
replace artist = "LL Cool J" in 154
replace rank = 6 in 154
replace month = 36 in 154

replace title = "Gimme The Light" in 155
replace artist = "Sean Paul" in 155
replace rank = 7 in 155
replace month = 36 in 155

replace title = "'03 Bonnie & Clyde" in 156
replace artist = "Jay-Z" in 156
replace rank = 8 in 156
replace month = 36 in 156

replace title = "Hey Ma" in 157
replace artist = "Cam'ron" in 157
replace rank = 9 in 157
replace month = 36 in 157

replace title = "Air Force Ones" in 158
replace artist = "Nelly" in 158
replace rank = 10 in 158
replace month = 36 in 158

replace title = "Dilemma" in 159
replace artist = "Nelly" in 159
replace rank = 11 in 159
replace month = 36 in 159

replace title = "Love Of My Life (An Ode To Hip Hop)" in 160
replace artist = "Erykah Badu" in 160
replace rank = 13 in 160
replace month = 36 in 160

replace title = "Lose Yourself" in 161
replace artist = "Eminem" in 161
replace rank = 1 in 161
replace month = 37 in 161

replace title = "Work It" in 162
replace artist = "Missy 'Misdemeanor' Elliott" in 162
replace rank = 2 in 162
replace month = 37 in 162

replace title = "Air Force Ones" in 163
replace artist = "Nelly" in 163
replace rank = 3 in 163
replace month = 37 in 163

replace title = "'03 Bonnie & Clyde" in 164
replace artist = "Jay-Z" in 164
replace rank = 4 in 164
replace month = 37 in 164

replace title = "Jenny From The Block" in 165
replace artist = "Jennifer Lopez" in 165
replace rank = 5 in 165
replace month = 37 in 165

replace title = "Bump, Bump, Bump" in 166
replace artist = "B2K & P. Diddy" in 166
replace rank = 7 in 166
replace month = 37 in 166

replace title = "Love Of My Life (An Ode To Hip Hop)" in 167
replace artist = "Erykah Badu" in 167
replace rank = 9 in 167
replace month = 37 in 167

replace title = "All I Have" in 168
replace artist = "Jennifer Lopez" in 168
replace rank = 15 in 168
replace month = 37 in 168

replace title = "Gimme The Light" in 169
replace artist = "Sean Paul" in 169
replace rank = 18 in 169
replace month = 37 in 169

replace title = "Thugz Mansion" in 170
replace artist = "2Pac" in 170
replace rank = 19 in 170
replace month = 37 in 170

replace title = "Bump, Bump, Bump" in 171
replace artist = "B2K & P. Diddy" in 171
replace rank = 1 in 171
replace month = 38 in 171

replace title = "All I Have" in 172
replace artist = "Jennifer Lopez" in 172
replace rank = 5 in 172
replace month = 38 in 172

replace title = "'03 Bonnie & Clyde" in 173
replace artist = "Jay-Z" in 173
replace rank = 6 in 173
replace month = 38 in 173

replace title = "Air Force Ones" in 174
replace artist = "Nelly" in 174
replace rank = 7 in 174
replace month = 38 in 174

replace title = "Mesmerize" in 175
replace artist = "Ja Rule" in 175
replace rank = 8 in 175
replace month = 38 in 175

replace title = "Lose Yourself" in 176
replace artist = "Eminem" in 176
replace rank = 9 in 176
replace month = 38 in 176

replace title = "Work It" in 177
replace artist = "Miss 'Misdemeanor' Elliott" in 177
replace rank = 13 in 177
replace month = 38 in 177

replace title = "In Da Club" in 178
replace artist = "50 Cent" in 178
replace rank = 15 in 178
replace month = 38 in 178

replace title = "Jenny From The Block" in 179
replace artist = "Jennifer Lopez" in 179
replace rank = 18 in 179
replace month = 38 in 179

replace title = "All I Have" in 180
replace artist = "Jennifer Lopez" in 180
replace rank = 1 in 180
replace month = 39 in 180

replace title = "In Da Club" in 181
replace artist = "50 Cent" in 181
replace rank = 2 in 181
replace month = 39 in 181

replace title = "Mesmerize" in 182
replace artist = "Ja Rule" in 182
replace rank = 3 in 182
replace month = 39 in 182

replace title = "Bump, Bump, Bump" in 183
replace artist = "B2K & P. Diddy" in 183
replace rank = 4 in 183
replace month = 39 in 183

replace title = "Gossip Folks" in 184
replace artist = "Missy Elliott" in 184
replace rank = 9 in 184
replace month = 39 in 184

replace title = "Wanksta" in 185
replace artist = "50 Cent" in 185
replace rank = 13 in 185
replace month = 39 in 185

replace title = "'03 Bonnie & Clyde" in 186
replace artist = "Jay-Z" in 186
replace rank = 16 in 186
replace month = 39 in 186

replace title = "Superman" in 187
replace artist = "Eminem" in 187
replace rank = 17 in 187
replace month = 39 in 187

replace title = "Air Force Ones" in 188
replace artist = "Air Force Ones" in 188
replace rank = 19 in 188
replace month = 39 in 188

replace title = "In Da Club" in 189
replace artist = "50 Cent" in 189
replace rank = 1 in 189
replace month = 40 in 189

replace title = "All I Have" in 190
replace artist = "Jennifer Lopez" in 190
replace rank = 5 in 190
replace month = 40 in 190

replace title = "Get Busy" in 191
replace artist = "Sean Paul" in 191
replace rank = 6 in 191
replace month = 40 in 191

replace title = "Excuse Me Miss" in 192
replace artist = "Jay-Z" in 192
replace rank = 9 in 192
replace month = 40 in 192

replace title = "Mesmerize" in 193
replace artist = "Ja Rule" in 193
replace rank = 10 in 193
replace month = 40 in 193

replace title = "Beautiful" in 194
replace artist = "Snoop Dogg" in 194
replace rank = 12 in 194
replace month = 40 in 194

replace title = "Gossip Folks" in 195
replace artist = "Missy Elliott" in 195
replace rank = 13 in 195
replace month = 40 in 195

replace title = "I Know What You Want" in 196
replace artist = "Busta Rhymes & Mariah Carey" in 196
replace rank = 14 in 196
replace month = 40 in 196

replace title = "I Can" in 197
replace artist = "Nas" in 197
replace rank = 17 in 197
replace month = 40 in 197

replace title = "Hell Yeah" in 198
replace artist = "Genuwine" in 198
replace rank = 18 in 198
replace month = 40 in 198

replace title = "Can't Let You Go" in 199
replace artist = "Fabolous" in 199
replace rank = 19 in 199
replace month = 40 in 199

replace title = "The Jump Off" in 200
replace artist = "Lil' Kim" in 200
replace rank = 20 in 200
replace month = 40 in 200

replace title = "In Da Club" in 201
replace artist = "50 Cent" in 201
replace rank = 1 in 201
replace month = 41 in 201

replace title = "Get Busy" in 202
replace artist = "Sean Paul" in 202
replace rank = 2 in 202
replace month = 41 in 202

replace title = "21 Questions" in 203
replace artist = "50 Cent" in 203
replace rank = 5 in 203
replace month = 41 in 203

replace title = "I Know What You Want" in 204
replace artist = "Busta Rhymes & Mariah Carey" in 204
replace rank = 7 in 204
replace month = 41 in 204

replace title = "Can't Let You Go" in 205
replace artist = "Fabolous" in 205
replace rank = 8 in 205
replace month = 41 in 205

replace title = "Beautiful" in 206
replace artist = "Snoop Dogg" in 206
replace rank = 11 in 206
replace month = 41 in 206

replace title = "I Can" in 207
replace artist = "Nas" in 207
replace rank = 13 in 207
replace month = 41 in 207

replace title = "Sing For The Moment" in 208
replace artist = "Eminem" in 208
replace rank = 16 in 208
replace month = 41 in 208

replace title = "Excuse Me Miss" in 209
replace artist = "Jay-Z" in 209
replace rank = 19 in 209
replace month = 41 in 209

replace title = "21 Questions" in 210
replace artist = "50 Cent" in 210
replace rank = 1 in 210
replace month = 42 in 210

replace title = "Get Busy" in 211
replace artist = "Sean Paul" in 211
replace rank = 2 in 211
replace month = 42 in 211

replace title = "I Know What You Want" in 212
replace artist = "Busta Rhymes & Mariah Carey" in 212
replace rank = 3 in 212
replace month = 42 in 212

replace title = "Can't Let You Go" in 213
replace artist = "Fabolous" in 213
replace rank = 4 in 213
replace month = 42 in 213

replace title = "Magic Stick" in 214
replace artist = "Lil' Kim" in 214
replace rank = 8 in 214
replace month = 42 in 214

replace title = "In Da Club" in 215
replace artist = "50 Cent" in 215
replace rank = 9 in 215
replace month = 42 in 215

replace title = "Crazy In Love" in 216
replace artist = "Beyonce" in 216
replace rank = 13 in 216
replace month = 42 in 216

replace title = "Beautiful" in 217
replace artist = "Snoop Dogg" in 217
replace rank = 19 in 217
replace month = 42 in 217

replace title = "Crazy In Love" in 218
replace artist = "Beyonce" in 218
replace rank = 3 in 218
replace month = 43 in 218

replace title = "Magic Stick" in 219
replace artist = "Lil' Kim" in 219
replace rank = 4 in 219
replace month = 43 in 219

replace title = "21 Questions" in 220
replace artist = "50 Cent" in 220
replace rank = 5 in 220
replace month = 43 in 220

replace title = "Get Busy" in 221
replace artist = "Sean Paul" in 221
replace rank = 6 in 221
replace month = 43 in 221

replace title = "I Know What You Want" in 222
replace artist = "Busta Rhymes & Mariah Carey" in 222
replace rank = 9 in 222
replace month = 43 in 222

replace title = "Can't Let You Go" in 223
replace artist = "Fabolous" in 223
replace rank = 13 in 223
replace month = 43 in 223

replace title = "Right Thurr" in 224
replace artist = "Chingy" in 224
replace rank = 15 in 224
replace month = 43 in 224

replace title = "Crazy In Love" in 225
replace artist = "Beyonce" in 225
replace rank = 1 in 225
replace month = 44 in 225

replace title = "Right Thurr" in 226
replace artist = "Chingy" in 226
replace rank = 3 in 226
replace month = 44 in 226

replace title = "Magic Stick" in 227
replace artist = "Lil' Kim" in 227
replace rank = 4 in 227
replace month = 44 in 227

replace title = "P.I.M.P." in 228
replace artist = "50 Cent" in 228
replace rank = 7 in 228
replace month = 44 in 228

replace title = "Into You" in 229
replace artist = "Fabolous" in 229
replace rank = 14 in 229
replace month = 44 in 229

replace title = "Get Busy" in 230
replace artist = "Sean Paul" in 230
replace rank = 15 in 230
replace month = 44 in 230

replace title = "Get Low" in 231
replace artist = "Lil Jon & The East Side Boyz" in 231
replace rank = 14 in 231
replace month = 44 in 231

replace title = "Like Glue" in 232
replace artist = "Sean Paul" in 232
replace rank = 17 in 232
replace month = 44 in 232

replace title = "Shake Ya Tailfeather" in 233
replace artist = "Nelly, P. Diddy & Murph Lee" in 233
replace rank = 18 in 233
replace month = 44 in 233

replace title = "Frontin'" in 234
replace artist = "Pharrell" in 234
replace rank = 20 in 234
replace month = 44 in 234

replace title = "Shake Ya Tailfeather" in 235
replace artist = "Nelly" in 235
replace rank = 1 in 235
replace month = 45 in 235

replace title = "Crazy In Love" in 236
replace artist = "Beyonce" in 236
replace rank = 2 in 236
replace month = 45 in 236

replace title = "Right Thurr" in 237
replace artist = "Chingy" in 237
replace rank = 3 in 237
replace month = 45 in 237

replace title = "P.I.M.P." in 238
replace artist = "50 Cent" in 238
replace rank = 4 in 238
replace month = 45 in 238

replace title = "Into You" in 239
replace artist = "Fabolous" in 239
replace rank = 5 in 239
replace month = 45 in 239

replace title = "Get Low" in 240
replace artist = "Lil Jon & East Side Boyz" in 240
replace rank = 6 in 240
replace month = 45 in 240

replace title = "Frontin'" in 241
replace artist = "Pharrell" in 241
replace rank = 7 in 241
replace month = 45 in 241

replace title = "Baby Boy" in 242
replace artist = "Beyonce" in 242
replace rank = 9 in 242
replace month = 45 in 242

replace title = "Like Glue" in 243
replace artist = "Sean Paul" in 243
replace rank = 15 in 243
replace month = 45 in 243

replace title = "Let's Get Down" in 244
replace artist = "Bow Wow" in 244
replace rank = 18 in 244
replace month = 45 in 244

replace title = "Baby Boy" in 245
replace artist = "Beyonce" in 245
replace rank = 1 in 245
replace month = 46 in 245

replace title = "Shake Ya Tailfeather" in 246
replace artist = "Nelly, P. Diddy & Murphy Lee" in 246
replace rank = 2 in 246
replace month = 46 in 246

replace title = "Right Thurr" in 247
replace artist = "Chingy" in 247
replace rank = 3 in 247
replace month = 46 in 247

replace title = "Get Low" in 248
replace artist = "Lil Jon & The East Side Boyz" in 248
replace rank = 4 in 248
replace month = 46 in 248

replace title = "Frontin'" in 249
replace artist = "Pharrell" in 249
replace rank = 5 in 249
replace month = 46 in 249

replace title = "Into You" in 250
replace artist = "Fabolous" in 250
replace rank = 6 in 250
replace month = 46 in 250

replace title = "P.I.M.P." in 251
replace artist = "50 Cent" in 251
replace rank = 7 in 251
replace month = 46 in 251

replace title = "Damn!" in 252
replace artist = "YoungBloodZ" in 252
replace rank = 9 in 252
replace month = 46 in 252

replace title = "Crazy In Love" in 253
replace artist = "Beyonce" in 253
replace rank = 11 in 253
replace month = 46 in 253

replace title = "Stand Up" in 254
replace artist = "Ludacris" in 254
replace rank = 15 in 254
replace month = 46 in 254

replace title = "Can't Stop, Won't Stop" in 255
replace artist = "Young Gunz" in 255
replace rank = 16 in 255
replace month = 46 in 255

replace title = "Baby Boy" in 256
replace artist = "Beyonce" in 256
replace rank = 1 in 256
replace month = 47 in 256

replace title = "Stand Up" in 257
replace artist = "Ludacris" in 257
replace rank = 2 in 257
replace month = 47 in 257

replace title = "Get Low" in 258
replace artist = "Lil Jon & The East Side Boyz" in 258
replace rank = 3 in 258
replace month = 47 in 258

replace title = "Damn!" in 259
replace artist = "YoungBloodZ" in 259
replace rank = 4 in 259
replace month = 47 in 259

replace title = "Shake Ya Tailfeather" in 260
replace artist = "Nelly, P. Diddy & Murphy Lee" in 260
replace rank = 5 in 260
replace month = 47 in 260

replace title = "Holidae In" in 261
replace artist = "Chingy" in 261
replace rank = 7 in 261
replace month = 47 in 261

replace title = "Right Thurr" in 262
replace artist = "Chingy" in 262
replace rank = 8 in 262
replace month = 47 in 262

replace title = "Suga Suga" in 263
replace artist = "Baby Bash" in 263
replace rank = 11 in 263
replace month = 47 in 263

replace title = "The Way You Move" in 264
replace artist = "OutKast" in 264
replace rank = 12 in 264
replace month = 47 in 264

replace title = "P.I.M.P." in 265
replace artist = "50 Cent" in 265
replace rank = 15 in 265
replace month = 47 in 265

replace title = "Frontin'" in 266
replace artist = "Pharrell" in 266
replace rank = 16 in 266
replace month = 47 in 266

replace title = "Into You" in 267
replace artist = "Fabolous" in 267
replace rank = 19 in 267
replace month = 47 in 267

replace title = "Stand Up" in 268
replace artist = "Ludacris" in 268
replace rank = 1 in 268
replace month = 48 in 268

replace title = "Hey Ya!" in 269
replace artist = "OutKast" in 269
replace rank = 2 in 269
replace month = 48 in 269

replace title = "Baby Boy" in 270
replace artist = "Beyonce" in 270
replace rank = 3 in 270
replace month = 48 in 270

replace title = "The Way You Move" in 271
replace artist = "OutKast" in 271
replace rank = 4 in 271
replace month = 48 in 271

replace title = "Holidae In" in 272
replace artist = "Chingy" in 272
replace rank = 5 in 272
replace month = 48 in 272

replace title = "Suga Suga" in 273
replace artist = "Baby Bash" in 273
replace rank = 7 in 273
replace month = 48 in 273

replace title = "Damn!" in 274
replace artist = "YoungBloodZ" in 274
replace rank = 9 in 274
replace month = 48 in 274

replace title = "Get Low" in 275
replace artist = "Lil  Jon & The East Side Boyz" in 275
replace rank = 11 in 275
replace month = 48 in 275

replace title = "Stunt 101" in 276
replace artist = "G-Unit" in 276
replace rank = 13 in 276
replace month = 48 in 276

replace title = "Change Clothes" in 277
replace artist = "Jay-Z" in 277
replace rank = 15 in 277
replace month = 48 in 277

replace title = "Wad Da Hook Gon Be" in 278
replace artist = "Murphy Lee" in 278
replace rank = 17 in 278
replace month = 48 in 278

replace title = "Runnin (Dying To Live)" in 279
replace artist = "Tupac" in 279
replace rank = 20 in 279
replace month = 48 in 279

replace title = "Hey Ya!" in 280
replace artist = "OutKast" in 280
replace rank = 1 in 280
replace month = 49 in 280

replace title = "The Way You Move" in 281
replace artist = "OutKast" in 281
replace rank = 2 in 281
replace month = 49 in 281

replace title = "Stand Up" in 282
replace artist = "Ludacris" in 282
replace rank = 5 in 282
replace month = 49 in 282

replace title = "Suga Suga" in 283
replace artist = "Baby Bash" in 283
replace rank = 7 in 283
replace month = 49 in 283

replace title = "Slow Jamz" in 284
replace artist = "Twista" in 284
replace rank = 9 in 284
replace month = 49 in 284

replace title = "Baby Boy" in 285
replace artist = "Beyonce" in 285
replace rank = 13 in 285
replace month = 49 in 285

replace title = "Holidae In" in 286
replace artist = "Chingy" in 286
replace rank = 14 in 286
replace month = 49 in 286

replace title = "Damn!" in 287
replace artist = "YoungBloodZ" in 287
replace rank = 15 in 287
replace month = 49 in 287

replace title = "Change Clothes" in 288
replace artist = "Jay-Z" in 288
replace rank = 17 in 288
replace month = 49 in 288

replace title = "Get Low" in 289
replace artist = "Lil Jon & The East Side Boyz" in 289
replace rank = 18 in 289
replace month = 49 in 289

replace title = "Runnin (Dying To Live)" in 290
replace artist = "Tupac" in 290
replace rank = 20 in 290
replace month = 49 in 290

replace title = "Hey Ya!" in 291
replace artist = "OutKast" in 291
replace rank = 1 in 291
replace month = 50 in 291

replace title = "The Way You Move" in 292
replace artist = "OutKast" in 292
replace rank = 2 in 292
replace month= 50 in 292

replace title = "Slow Jamz" in 293
replace artist = "Twista" in 293
replace rank = 3 in 293
replace month = 50 in 293

replace title = "Yeah!" in 294
replace artist = "Usher" in 294
replace rank = 6 in 294
replace month = 50 in 294

replace title = "Suga Suga" in 295
replace artist = "Baby Bash" in 295
replace rank = 11 in 295
replace month = 50 in 295

replace title = "Salt Shaker" in 296
replace artist = "Ying Yang Twins" in 296
replace rank = 13 in 296
replace month = 50 in 296

replace title = "Stand Up" in 297
replace artist = "Ludacris" in 297
replace rank = 15 in 297
replace month = 50 in 297

replace title = "Through The Wire" in 298
replace artist = "Kanye West" in 298
replace rank = 16 in 298
replace month = 50 in 298

replace title = "Hotel" in 299
replace artist = "Cassidy" in 299
replace rank = 20 in 299
replace month = 50 in 299

replace title = "Yeah!" in 300
replace artist = "Usher" in 300
replace rank = 1 in 300
replace month = 51 in 300

replace title = "Slow Jamz" in 301
replace artist = "Twista" in 301
replace rank = 2 in 301
replace month = 51 in 301

replace title = "The Way You Move" in 302
replace artist = "OutKast" in 302
replace rank = 3 in 302
replace month = 51 in 302

replace title = "One Call Away" in 303
replace artist = "Chingy" in 303
replace rank = 4 in 303
replace month = 51 in 303

replace title = "Hey Ya!" in 304
replace artist = "OutKast" in 304
replace rank = 6 in 304
replace month = 51 in 304

replace title = "Hotel" in 305
replace artist = "Casidy" in 305
replace rank = 7 in 305
replace month = 51 in 305

replace title = "Tipsy" in 306
replace artist = "J-Kwon" in 306
replace rank = 8 in 306
replace month = 51 in 306

replace title = "Splash Waterfalls" in 307
replace artist = "Ludacris" in 307
replace rank = 9 in 307
replace month = 51 in 307

replace title = "Salt Shaker" in 308
replace artist = "Ying Yang Twins" in 308
replace rank = 12 in 308
replace month = 51 in 308

replace title = "Through The Wire" in 309
replace artist = "Kanye West" in 309
replace rank = 15 in 309
replace month = 51 in 309

replace title = "Dirt Off Your Shoulder" in 310
replace artist = "Jay-Z" in 310
replace rank = 18 in 310
replace month = 51 in 310

replace title = "Yeah!" in 311
replace artist = "Usher" in 311
replace rank = 1 in 311
replace month = 52 in 311

replace title = "One Call Away" in 312
replace artist = "Chingy" in 312
replace rank = 2 in 312
replace month = 52 in 312

replace title = "Tipsy" in 313
replace artist = "J-Kwon" in 313
replace rank = 3 in 313
replace month = 52 in 313

replace title = "Hotel" in 313
replace artist = "Cassidy" in 313
replace rank = 5 in 313
replace month = 52 in 313

replace title = "Dirt Off Your Shoulder" in 314
replace artist = "Jay-Z" in 314
replace rank = 8 in 314
replace month = 52 in 314

replace title = "Splash Waterfalls" in 315
replace artist = "Ludacris" in 315
replace rank = 7 in 315
replace month = 52 in 315

replace title = "Slow Jamz" in 316
replace artist = "Twista" in 316
replace rank = 12 in 316
replace month = 52 in 316

replace title = "The Way You Move" in 317
replace artist = "OutKast" in 317
replace rank = 13 in 317
replace month = 52 in 317

replace title = "Wanna Get To Know You" in 318
replace artist = "G-Unit" in 318
replace rank = 17 in 318
replace month = 52 in 318

replace title = "I'm Still In Love With You" in 319
replace artist = "Sean Paul" in 319
replace rank = 20 in 319
replace month = 52 in 319

replace title = "Yeah!" in 320
replace artist = "Usher" in 320
replace rank = 1 in 320
replace month = 53 in 320

replace title = "Tipsy" in 321
replace artist = "J-Kwon" in 321
replace rank = 4 in 321
replace month = 53 in 321

replace title = "My Band" in 322
replace artist = "D12" in 322
replace rank = 8 in 322
replace month = 53 in 322

replace title = "All Falls Down" in 323
replace artist = "Kanye West" in 323
replace rank = 9 in 323
replace month = 53 in 323

replace title = "Dirt Off Your Shoulder" in 324
replace artist = "Jay-Z" in 324
replace rank = 10 in 324
replace month = 53 in 324

replace title = "Freek-A-Leek" in 325
replace artist = "Petey Pablo" in 325
replace rank = 11 in 325
replace month = 53 in 325

replace title = "Overnight Celebrity" in 326
replace artist = "Twista" in 326
replace rank = 12 in 326
replace month = 53 in 326

replace title = "One Call Away" in 327
replace artist = "Chingy" in 327
replace rank = 13 in 327
replace month = 53 in 327

replace title = "Game Over (Flip)" in 328
replace artist = "Lil' Flip" in 328
replace rank = 16 in 328
replace month = 53 in 328

replace title = "I'm Still In Love With You" in 329
replace artist = "Sean Paul" in 329
replace rank = 18 in 329
replace month = 53 in 329

replace title = "Hotel" in 330
replace artist = "Cassidy" in 330
replace rank = 19 in 330
replace month = 53 in 330

replace title = "The Way You Move" in 331
replace artist = "OutKast" in 331
replace rank = 20 in 331
replace month = 53 in 331

replace title = "Yeah!" in 332
replace artist = "Usher" in 332
replace rank = 4 in 332
replace month = 54 in 332

replace title = "Overnight Celebrity" in 333
replace artist = "Twista" in 333
replace rank = 6 in 333
replace month = 54 in 333

replace title = "Freek-A-Leek" in 334
replace artist = "Petey Pablo" in 334
replace rank = 10 in 334
replace month = 54 in 334

replace title = "All Falls Down" in 335
replace artist = "Kanye West" in 335
replace rank = 11 in 335
replace month = 54 in 335

replace title = "Roses" in 336
replace artist = "OutKast" in 336
replace rank = 12 in 336
replace month = 54 in 336

replace title = "Tipsy" in 337
replace artist = "J-Kwon" in 337
replace rank = 13 in 337
replace month = 54 in 337

replace title = "My Band" in 338
replace artist = "D12" in 338
replace rank = 14 in 338
replace month = 54 in 338

replace title = "Dirt Off Your Shoulder" in 339
replace artist = "Jay-Z" in 339
replace rank = 15 in 339
replace month = 54 in 339

replace title = "Game Over (Flip)" in 340
replace artist = "Lil' Flip" in 340
replace rank = 18 in 340
replace month = 54 in 340

replace title = "Slow Motion" in 341
replace artist = "Juvenile" in 341
replace rank = 19 in 341
replace month = 54 in 341

replace title = "I'm Still In Love With You" in 342
replace artist = "Sean Paul" in 342
replace rank = 20 in 342
replace month = 54 in 342

replace title = "Slow Motion" in 343
replace artist = "Juvenile" in 343
replace rank = 5 in 343
replace month = 55 in 343

replace title = "Freek-A-Leek" in 344
replace artist = "Petey Pablo" in 344
replace rank = 7 in 344
replace month = 55 in 344

replace title = "Yeah!" in 345
replace artist = "Usher" in 345
replace rank = 8 in 345
replace month = 55 in 345

replace title = "Overnight Celebrity" in 346
replace artist = "Twista" in 346
replace rank = 9 in 346
replace month = 55 in 346

replace title = "Roses" in 347
replace artist = "OutKast" in 347
replace rank = 12 in 347
replace month = 55 in 347

replace title = "On Fire" in 348
replace artist = "Lloyd Banks" in 348
replace rank = 14 in 348
replace month = 55 in 348

replace title = "Jesus Walks" in 349
replace artist = "Kanye West" in 349
replace rank = 16 in 349
replace month = 55 in 349

replace title = "Tipsy" in 350
replace artist = "J-Kwon" in 350
replace rank = 20 in 350
replace month = 55 in 350

replace title = "Slow Motion" in 351
replace artist = "Juvenile" in 351
replace rank = 1 in 351
replace month = 56 in 351

replace title = "Lean Back" in 352
replace artist = "Terror Squad" in 352
replace rank = 3 in 352
replace month = 56 in 352

replace title = "Sunshine" in 353
replace artist = "Lil' Flip" in 353
replace rank = 10 in 353
replace month = 56 in 353

replace title = "Jesus Walks" in 354
replace artist = "Kanye West" in 354
replace rank = 11 in 354
replace month = 56 in 354

replace title = "I Like That" in 355
replace artist = "Houston" in 355
replace rank = 13 in 355
replace month = 56 in 355

replace title = "On Fire" in 356
replace artist = "Lloyd Banks" in 356
replace rank = 14 in 356
replace month = 56 in 356

replace title = "My Place" in 357
replace artist = "Nelly" in 357
replace rank = 17 in 357
replace month = 56 in 357

replace title = "Lean Back" in 358
replace artist = "Terror Squad" in 358
replace rank = 1 in 358
replace month = 57 in 358

replace title = "Sunshine" in 359
replace artist = "Lil' Flip" in 359
replace rank = 2 in 359
replace month = 57 in 359

replace title = "My Place" in 360
replace artist= "Nelly" in 360
replace rank = 4 in 360
replace month = 57 in 360

replace title = "Slow Motion" in 361
replace artist = "Juvenile" in 361
replace rank = 6 in 361
replace month = 57 in 361

replace title = "I Like That" in 362
replace artist = "Houston" in 362
replace rank = 12 in 362
replace month = 57 in 362

replace title = "Why?" in 363
replace artist = "Jadakiss" in 363
replace rank = 16 in 363
replace month = 57 in 363

replace title = "Locked Up" in 364
replace artist = "Akon" in 364
replace rank = 17 in 364
replace month = 57 in 364

replace title = "Headsprung" in 365
replace artist = "LL Cool J" in 365
replace rank = 19 in 365
replace month = 57 in 365

replace title = "Jesus Walks" in 366
replace artist = "Kanye West" in 366
replace rank = 20 in 366
replace month = 57 in 366

replace title = "Lean Back" in 367
replace artist = "Terror Squad" in 367
replace rank = 2 in 367
replace month = 58 in 367

replace title = "Sunshine" in 368
replace artist = "Lil' Flip" in 368
replace rank = 3 in 368
replace month = 58 in 368

replace title = "My Place" in 369
replace artist = "Nelly" in 369
replace rank = 4 in 369
replace month = 58 in 369

replace title = "Locked Up" in 370
replace artist = "Akon" in 370
replace rank = 10 in 370
replace month = 58 in 370

replace title = "Slow Motion" in 371
replace artist = "Juvenile" in 371
replace rank = 13 in 371
replace month = 58 in 371

replace title = "Why?" in 372
replace artist = "Jadakiss" in 372
replace rank = 15 in 372
replace month = 58 in 372

replace title = "Headsprung" in 373
replace artist = "LL Cool J" in 373
replace rank = 16 in 373
replace month = 58 in 373

replace title = "I Like That" in 374
replace artist = "Houston" in 374
replace rank = 18 in 374
replace month = 58 in 374

replace title = "Drop It Like It's Hot" in 375
replace artist = "Snoop Dogg" in 375
replace rank = 4 in 375
replace month = 59 in 375

replace title = "Over and Over" in 376
replace artist = "Nelly" in 376
replace rank = 5 in 376
replace month = 59 in 376

replace title = "Lean Back" in 377
replace artist = "Terror Squad" in 377
replace rank = 7 in 377
replace month = 59 in 377

replace title = "Just Lose It" in 378
replace artist = "Eminem" in 378
replace rank = 8 in 378
replace month = 59 in 378

replace title = "Let's Go" in 379
replace artist = "Trick Daddy" in 379
replace rank = 10 in 379
replace month = 59 in 379

replace title = "Locked Up" in 380
replace artist = "Akon" in 380
replace rank = 11 in 380
replace month = 59 in 380

replace title = "Oye Mi Canto" in 381
replace artist = "N.O.R.E." in 381
replace rank = 14 in 381
replace month = 59 in 381

replace title = "My Place" in 382
replace artist = "Nelly" in 382
replace rank = 15 in 382
replace month = 59 in 382

replace title = "Go D.J." in 383
replace artist = "Lil Wayne" in 383
replace rank = 16 in 383
replace month = 59 in 383

replace title = "Breathe" in 384
replace artist = "Fabolous" in 384
replace rank = 18 in 384
replace month = 59 in 384

replace title = "Drop It Like It's Hot" in 385
replace artist = "Snoop Dogg" in 385
replace rank = 2 in 385
replace month = 60 in 385

replace title = "Over and Over" in 386
replace artist = "Nelly" in 386
replace rank = 3 in 386
replace month = 60 in 386

replace title = "Wonderful" in 387
replace artist = "Ja Rule" in 387
replace rank = 6 in 387
replace month = 60 in 387

replace title = "Let's Go" in 388
replace artist = "Trick Daddy" in 388
replace rank = 7 in 388
replace month = 60 in 388

replace title = "1, 2 Step" in 389
replace artist = "Ciara" in 389
replace rank = 9 in 389
replace month = 60 in 389

replace title = "Breathe" in 390
replace artist = "Fabolous" in 390
replace rank = 11 in 390
replace month = 60 in 390

replace title = "Oye Mi Canto" in 391
replace artist = "N.O.R.E." in 391
replace rank = 13 in 391
replace month = 60 in 391

replace title = "Just Lose It" in 392
replace artist = "Eminem" in 392
replace rank = 14 in 392
replace month = 60 in 392

replace title = "Go D.J." in 393
replace artist = "Lil Wayne" in 393
replace rank = 15 in 393
replace month = 60 in 393

replace title = "Lovers and Friends" in 394
replace artist = "Lil Jon & The East Side Boyz" in 394
replace rank = 17 in 394
replace month = 60 in 394

replace title = "Shorty Wanna Ride" in 395
replace artist = "Young Buck" in 395
replace rank = 18 in 395
replace month = 60 in 395

replace title = "Soldier" in 396
replace artist = "Destiny's Child" in 396
replace rank = 20 in 396
replace month = 60 in 396

replace title = "Drop It Like It's Hot" in 397
replace artist = "Snoop Dogg" in 397
replace rank = 2 in 397
replace month = 61 in 397

replace title = "1, 2 Step" in 398
replace artist = "Ciara" in 398
replace rank = 3 in 398
replace month = 61 in 398

replace title = "Soldier" in 399
replace artist = "Destiny's Child" in 399
replace rank = 4 in 399
replace month = 61 in 399

replace title = "Lovers and Friends" in 400
replace artist = "Lil Jon & The East Side Boyz" in 400
replace rank = 5 in 400
replace month = 61 in 400

replace title = "Over and Over" in 401
replace artist = "Nelly" in 401
replace rank = 7 in 401
replace month = 61 in 401

replace title = "Wonderful" in 402
replace artist = "Ja Rule" in 402
replace rank = 8 in 402
replace month = 61 in 402

replace title = "Disco Inferno" in 403
replace artist = "50 Cent" in 403
replace rank = 11 in 403
replace month = 61 in 403

replace title = "Get Back" in 404
replace artist = "Ludacris" in 404
replace rank = 13 in 404
replace month = 61 in 404

replace title = "Let's Go" in 405
replace artist = "Trick Daddy" in 405
replace rank = 15 in 405
replace month = 61 in 405

replace title = "How We Do" in 406
replace artist = "The Game" in 406
replace rank = 16 in 406
replace month = 61 in 406

replace title = "Karma" in 407
replace artist = "Lloyd Banks" in 407
replace rank = 19 in 407
replace month = 61 in 407

replace title = "1, 2 Step" in 408
replace artist = "Ciara" in 408
replace rank = 2 in 408
replace month = 62 in 408

replace title = "Lovers and Friends" in 409
replace artist = "Lil Jon & The East Side Boyz" in 409
replace rank = 3 in 409
replace month = 62 in 409

replace title = "Soldier" in 410
replace artist = "Destiny's Child" in 410
replace rank = 4 in 410
replace month = 62 in 410

replace title = "Drop It Like It's Hot" in 411
replace artist = "Snoop Dogg" in 411
replace rank = 5 in 411
replace month = 62 in 411

replace title = "How We Do" in 412
replace artist = "The Game" in 412
replace rank = 6 in 412
replace month = 62 in 412

replace title = "Disco Inferno" in 413
replace artist = "50 Cent" in 413
replace rank = 7 in 413
replace month = 62 in 413

replace title = "Bring Em Out" in 414
replace artist = "T.I." in 414
replace rank = 9 in 414
replace month = 62 in 414

replace title = "Over and Over" in 415
replace artist = "Nelly" in 415
replace rank = 10 in 415
replace month = 62 in 415

replace title = "Get Back" in 416
replace artist = "Ludacris" in 416
replace rank = 15 in 416
replace month = 62 in 416

replace title = "Mockingbird" in 417
replace artist = "Eminem" in 417
replace rank = 18 in 417
replace month = 62 in 417

replace title = "Karma" in 418
replace artist = "Lloyd Banks" in 418
replace rank = 19 in 418
replace month = 62 in 418

replace title = "Candy Shop" in 419
replace artist = "50 Cent" in 419
replace rank = 1 in 419
replace month = 63 in 419

replace title = "How We Do" in 420
replace artist = "The Game" in 420
replace rank = 4 in 420
replace month = 63 in 420

replace title = "1, 2 Step" in 421
replace artist = "Ciara" in 421
replace rank = 5 in 421
replace month = 63 in 421

replace title = "Disco Inferno" in 422
replace artist = "50 Cent" in 422
replace rank = 6 in 422
replace month = 63 in 422

replace title = "Lovers and Friends" in 423
replace artist = "Lil Jon & The East Side Boyz" in 423
replace rank = 10 in 423
replace month = 63 in 423

replace title = "Soldier" in 424
replace artist = "Destiny's Child" in 424
replace rank = 11 in 424
replace month = 63 in 424

replace title = "Mockingbird" in 425
replace artist = "Eminem" in 425
replace rank = 13 in 425
replace month = 63 in 425

replace title = "Bring Em Out" in 426
replace artist = "T.I." in 426
replace rank = 14 in 426
replace month = 63 in 426

replace title = "Drop It Like It's Hot" in 427
replace artist = "Snoop Dogg" in 427
replace rank = 15 in 427
replace month = 63 in 427

replace title = "Candy Shop" in 428
replace artist = "50 Cent" in 428
replace rank = 1 in 428
replace month = 64 in 428

replace title = "Disco Inferno" in 429
replace artist = "50 Cent" in 429
replace rank = 5 in 429
replace month = 64 in 429

replace title = "Hate It Or Love It" in 430
replace artist = "The Game" in 430
replace rank = 6 in 430
replace month = 64 in 430

replace title = "How We Do" in 431
replace artist = "The Game" in 431
replace rank = 8 in 431
replace month = 64 in 431

replace title = "1, 2 Step" in 432
replace artist = "Ciara" in 432
replace rank = 11 in 432
replace month = 64 in 432

replace title = "Mockingbird" in 433
replace artist = "Eminem" in 433
replace rank = 12 in 433
replace month = 64 in 433

replace title = "Some Cut" in 434
replace artist = "Trillville" in 434
replace rank = 14 in 434
replace month = 64 in 434

replace title = "Lovers and Friends" in 435
replace artist = "Lil Jon & The East Side Boyz" in 435
replace rank = 17 in 435
replace month = 64 in 435

replace title = "Hate It Or Love It" in 436
replace artist = "The Game" in 436
replace rank = 2 in 436
replace month = 65 in 436

replace title = "Candy Shop" in 437
replace artist = "50 Cent" in 437
replace rank = 3 in 437
replace month = 65 in 437

replace title = "Oh" in 438
replace artist = "Ciara" in 438
replace rank = 5 in 438
replace month = 65 in 438

replace title = "Just A Lil Bit" in 439
replace artist = "50 Cent" in 439
replace rank = 14 in 439
replace month = 65 in 439

replace title = "Disco Inferno" in 440
replace artist = "50 Cent" in 440
replace rank = 15 in 440
replace month = 65 in 440

replace title = "Switch" in 441
replace artist = "Will Smith" in 441
replace rank = 17 in 441
replace month = 65 in 441

replace title = "Some Cut" in 442
replace artist = "Trillville" in 442
replace rank = 18 in 442
replace month = 65 in 442

replace title = "Oh" in 443
replace artist = "Ciara" in 443
replace rank = 3 in 443
replace month = 66 in 443

replace title = "Just A Lil Bit" in 444
replace artist = "50 Cent" in 444
replace rank = 4 in 444
replace month = 66 in 444

replace title = "Don't Phunk With My Heart" in 445
replace artist = "The Black Eyed Peas" in 445
replace rank = 5 in 445
replace month = 66 in 445

replace title = "Hate It Or Love It" in 446
replace artist = "The Game" in 446
replace rank = 6 in 446
replace month = 66 in 446

replace title = "Switch" in 447
replace artist = "Will Smith" in 447
replace rank = 9 in 447
replace month = 66 in 447

replace title = "Candy Shop" in 448
replace artist = "50 Cent" in 448
replace rank = 16 in 448
replace month = 66 in 448

replace title = "Feel Good Inc" in 449
replace artist = "Gorrillaz/De La Soul" in 449
replace rank = 17 in 449
replace month = 66 in 449

replace title = "Wait (The Whisper Song)" in 450
replace artist = "Ying Yang Twins" in 450
replace rank = 20 in 450
replace month = 66 in 450

replace title = "Don't Phunk With My Heart" in 451
replace artist = "The Black Eyed Peas" in 451
replace rank = 4 in 451
replace month = 67 in 451

replace title = "Just A Lil Bit" in 452
replace artist = "50 Cent" in 452
replace rank = 5 in 452
replace month = 67 in 452

replace title = "Oh" in 453
replace artist = "Ciara" in 453
replace rank = 7 in 453
replace month = 67 in 453

replace title = "Switch" in 454
replace artist = "Will Smith" in 454
replace rank = 9 in 454
replace month = 67 in 454

replace title = "Get It Poppin'" in 455
replace artist = "Fat Joe" in 455
replace rank = 10 in 455
replace month = 67 in 455

replace title = "Lose Control" in 456
replace artist = "Missy Elliott" in 456
replace rank = 4 in 456
replace month = 68 in 456

replace title = "Let Me Hold You" in 457
replace artist = "Bow Wow" in 457
replace rank = 5 in 457
replace month = 68 in 457

replace title = "Don't Phunk With My Heart" in 458
replace artist = "The Black Eyed Peas" in 458
replace rank = 8 in 458
replace month = 68 in 458

replace title = "Pimpin' All Over The World" in 459
replace artist = "Ludacris" in 459
replace rank = 9 in 459
replace month = 68 in 459

replace title = "Get It Poppin'" in 460
replace artist = "Fat Joe" in 460
replace rank = 10 in 460
replace month = 68 in 460

replace title = "Just A Lil Bit" in 461
replace artist = "50 Cent" in 461
replace rank = 14 in 461
replace month = 68 in 461

replace title = "Feel Good Inc" in 462
replace artist = "Gorillaz" in 462
replace rank = 16 in 462
replace month = 68 in 462

replace title = "Oh" in 463
replace artist = "Gorillaz" in 463
replace rank = 17 in 463
replace month = 68 in 463

replace title = "Switch" in 464
replace artist = "Will Smith" in 464
replace rank = 18 in 464
replace month = 68 in 464

replace title = "Let Me Hold You" in 465
replace artist = "Bow Wow" in 465
replace rank = 5 in 465
replace month = 69 in 465

replace title = "Lose Control" in 466
replace artist = "Missy Elliott" in 466
replace rank = 6 in 466
replace month = 69 in 466

replace title = "Like You" in 467
replace artist = "Bow Wow" in 467
replace rank = 9 in 467
replace month = 69 in 467

replace title = "Pimpin' All Over The World" in 468
replace artist = "Ludacris" in 468
replace rank = 12 in 468
replace month = 69 in 468

replace title = "Feel Good Inc" in 469
replace artist = "Gorillaz" in 469
replace rank = 16 in 469
replace month = 69 in 469

replace title = "Don't Lie" in 470
replace artist = "Black Eyed Peas" in 470
replace rank = 17 in 470
replace month = 69 in 470

replace title = "Get It Poppin'" in 471
replace artist = "Fat Joe" in 471
replace rank = 20 in 471
replace month = 69 in 471

replace title = "Gold Digger" in 472
replace artist = "Kanye West" in 472
replace rank = 1 in 472
replace month = 70 in 472

replace title = "Like You" in 473
replace artist = "Bow Wow" in 473
replace rank = 3 in 473
replace month = 70 in 473

replace title = "My Humps" in 474
replace artist = "The Black Eyed peas" in 474
replace rank = 4 in 474
replace month = 70 in 474

replace title = "Outta Control (Remix)" in 475
replace artist = "50 Cent" in 475
replace rank = 6 in 475
replace month = 70 in 475

replace title = "Lose Control" in 476
replace artist = "Missy Elliott" in 476
replace rank = 9 in 476
replace month = 70 in 476

replace title = "Play" in 477
replace artist = "David Banner" in 477
replace rank = 10 in 477
replace month = 70 in 477

replace title = "Let Me Hold You" in 478
replace artist = "Bow Wow" in 478
replace rank = 15 in 478
replace month = 70 in 478

replace title = "Feel Good Inc" in 479
replace artist = "Gorillaz" in 479
replace rank = 18 in 479
replace month = 70 in 479

replace title = "Don't Lie" in 480
replace artist = "The Black Eyed Peas" in 480
replace rank = 19 in 480
replace month = 70 in 480

replace title = "Soul Survivor" in 481
replace artist = "Young Jeezy" in 481
replace rank = 20 in 481
replace month = 70 in 481

replace title = "Gold Digger" in 482
replace artist = "Kany West" in 482
replace rank = 1 in 482
replace month = 71 in 482

replace title = "Run It!" in 483
replace artist = "Chris Brown" in 483
replace rank = 2 in 483
replace month = 71 in 483

replace title = "My Humps" in 484
replace artist = "Black Eyed Peas" in 484
replace rank = 3 in 484
replace month = 71 in 484

replace title = "Soul Survivor" in 485
replace artist = "Young Jeezy" in 485
replace rank = 5 in 485
replace month = 71 in 485

replace title = "Like You" in 486
replace artist = "Bow Wow" in 486
replace rank = 6 in 486
replace month = 71 in 486

replace title = "We Be Burnin'" in 487
replace artist = "Sean Paul" in 487
replace rank = 10 in 487
replace month = 71 in 487

replace title = "Your Body" in 488
replace artist= "Pretty Ricky" in 488
replace rank = 12 in 488
replace month = 71 in 488

replace title= "Play" in 489
replace artist = "David Banner" in 489
replace rank = 14 in 489
replace month = 71 in 489

replace title = "I'm Sprung" in 490
replace artist = "T-Pain" in 490
replace rank = 15 in 490
replace month = 71 in 490

replace title = "Girl Tonite" in 491
replace artist = "Twista" in 491
replace rank = 17 in 491
replace month = 71 in 491

replace title = "Run It!" in 492
replace artist = "Chris Brown" in 492
replace rank = 1 in 492
replace month = 72 in 492

replace title = "Gold Digger" in 493
replace artist = "Kanye West" in 493
replace rank = 2 in 493
replace month = 72 in 493

replace title = "My Humps" in 494
replace artist = "The Black Eyed Peas" in 494
replace rank = 3 in 494
replace month = 72 in 494

replace title = "Soul Survivor" in 495
replace artist = "Young Jeezy" in 495
replace rank = 4 in 495
replace month = 72 in 495

replace title = "Laffy Taffy" in 496
replace artist = "D4L" in 496
replace rank = 6 in 496
replace month = 72 in 496

replace title = "We Be Burnin'" in 497
replace artist = "Sean Paul" in 497
replace rank = 8 in 497
replace month = 72 in 497

replace title = "I'm Sprung" in 498
replace artist = "T-Pain" in 498
replace rank = 12 in 498
replace month = 72 in 498

replace title = "Stay Fly" in 499
replace artist = "Three 6 Mafia" in 499
replace rank = 13 in 499
replace month = 72 in 499

replace title = "I Think They Like Me" in 500
replace artist = "Dem Franchize Boyz" in 500
replace rank = 15 in 500
replace month = 72 in 500

replace title = "There It Go! (The Whistle Song)" in 501
replace artist = "Juelz Santana" in 501
replace rank = 19 in 501
replace month = 72 in 501

replace title = "Window Shopper" in 502
replace artist = "50 Cent" in 502
replace rank = 20 in 502
replace month = 72 in 502

replace title = "Run It!" in 503
replace artist = "Chris Brown" in 503
replace rank = 2 in 503
replace month = 73 in 503

replace title = "Grillz" in 504
replace artist = "Nelly" in 504
replace rank = 3 in 504
replace month = 73 in 504

replace title = "Laffy Taffy" in 505
replace artist = "D4L" in 505
replace rank = 4 in 505
replace month = 73 in 505

replace title = "Check On It" in 506
replace artist = "Beyonce" in 506
replace rank = 7 in 506
replace month = 73 in 506

replace title = "Gold Digger" in 507
replace artist = "Kanye West" in 507
replace rank = 8 in 507
replace month = 73 in 507

replace title = "There It Go! (The Whistle Song)" in 508
replace artist = "Juelz Santana" in 508
replace rank = 9 in 508
replace month = 73 in 508

replace title = "My Humps" in 509
replace artist = "The Black Eyed Peas" in 509
replace rank = 10 in 509
replace month = 73 in 509

replace title = "Soul Survivor" in 510
replace artist = "Young Jeezy" in 510
replace rank = 14 in 510
replace month = 73 in 510

replace title = "I Think They Like Me" in 511
replace artist = "Dem Franchize Boyz" in 511
replace rank = 16 in 511
replace month = 73 in 511

replace title = "Stay Fly" in 512
replace artist = "Three 6 Mafia" in 512
replace rank = 18 in 512
replace month = 73 in 512

replace title = "When I'm Gone" in 513
replace artist = "Eminem" in 513
replace rank = 19 in 513
replace month = 73 in 513

replace title = "I'm Sprung" in 514
replace artist = "T-Pain" in 514
replace rank = 20 in 514
replace month = 73 in 514

replace title = "Check On It" in 515
replace artist = "Beyonce" in 515
replace rank = 1 in 515
replace month = 74 in 515

replace title = "Grillz" in 516
replace artist = "Nelly" in 516
replace rank = 2 in 516
replace month = 74 in 516

replace title = "Run It!" in 517
replace artist = "Chris Brown" in 517
replace rank = 3 in 517
replace month = 74 in 517

replace title = "There It Go! (The Whistle Song)" in 518
replace artist = "Juelz Santana" in 518
replace rank = 6 in 518
replace month = 74 in 518

replace title = "Laffy Taffy" in 519
replace artist = "D4L" in 519
replace rank = 10 in 519
replace month = 74 in 519

replace title = "Gold Digger" in 520
replace artist = "Kanye West" in 520
replace rank = 17 in 520
replace month = 74 in 520

replace title = "My Humps" in 521
replace artist = "The Black Eyed Peas" in 521
replace rank = 20 in 521
replace month = 74 in 521

replace title = "Check On It" in 522
replace artist = "Beyonce" in 522
replace rank = 1 in 522
replace month = 75 in 522

replace title = "Grillz" in 523
replace artist = "Nelly" in 523
replace rank = 3 in 523
replace month = 75 in 523

replace title = "Temperature" in 524
replace artist = "Sean Paul" in 524
replace rank = 4 in 524
replace month = 75 in 524

replace title = "I'm N Luv (Wit A Stripper)" in 525
replace artist = "T-Pain" in 525
replace rank = 6 in 525
replace month = 75 in 525

replace title = "Shake That" in 526
replace artist = "Eminem" in 526
replace rank = 10 in 526
replace month = 75 in 526

replace title = "Lean Wit It, Rock Wit It" in 527
replace artist = "Dem Franchize Boyz" in 527
replace rank = 11 in 527
replace month = 75 in 527

replace title = "Run It!" in 528
replace artist = "Chris Brown" in 528
replace rank = 17 in 528
replace month = 75 in 528

replace title = "Pump It" in 529
replace artist = "The Black Eyed Peas" in 529
replace rank = 20 in 529
replace month = 75 in 529

replace title = "Temperature" in 530
replace artist = "Sean Paul" in 530
replace rank= 1 in 530
replace month = 76 in 530

replace title = "Lean Wit It, Rock Wit It" in 531
replace artist = "Dem Franchize Boyz" in 531
replace rank = 7 in 531
replace month = 76 in 531

replace title = "I'm N Luv (Wit A Stripper)" in 532
replace artist = "T-Pain" in 532
replace rank = 8 in 532
replace month = 76 in 532

replace title = "Check On It" in 533
replace artist = "Beyonce" in 533
replace rank = 10 in 533
replace month = 76 in 533

replace title = "Grillz" in 534
replace artist = "Nelly" in 534
replace rank = 12 in 534
replace month = 76 in 534

replace title = "Ms. New Booty" in 535
replace artist = "Bubba Sparxx" in 535
replace rank = 13 in 535
replace month = 76 in 535

replace title = "Shake That" in 536
replace artist = "Eminem" in 536
replace rank = 15 in 536
replace month = 76 in 536

replace title = "Touch It" in 537
replace artist = "Busta Rhymes" in 537
replace rank = 18 in 537
replace month = 76 in 537

replace title = "Temperature" in 538
replace artist = "Sean Paul" in 538
replace rank = 2 in 538
replace month = 77 in 538

replace title = "What You Know" in 539
replace artist = "T.I." in 539
replace rank = 3 in 539
replace month= 77 in 539

replace title = "Ridin'" in 540
replace artist = "Chamillionaire" in 540
replace rank = 4 in 540
replace month = 77 in 540

replace title = "Control Myself" in 541
replace artist = "LL Cool J" in 541
replace rank = 6 in 541
replace month = 77 in 541

replace title = "Lean Wit It, Rock Wit It" in 542
replace artist = "Dem Franchize Boyz" in 542
replace rank = 7 in 542
replace month = 77 in 542

replace title = "Ms. New Booty" in 543
replace artist = "Bubba Sparxxx" in 543
replace rank = 9 in 543
replace month= 77 in 543

replace title = "Ridin'" in 544
replace artist = "Chamillionaire" in 544
replace rank = 1 in 544
replace month = 78 in 544

replace title = "Temperature" in 545
replace artist = "Sean Paul" in 545
replace rank = 4 in 545
replace month = 78 in 545

replace title = "Where'd You Go" in 546
replace artist = "Fort Minor" in 546
replace rank = 5 in 546
replace month = 78 in 546

replace title = "Snap Yo Fingers" in 547
replace artist = "Lil Jon" in 547
replace rank = 7 in 547
replace month = 78 in 547


replace title = "What You Know" in 548
replace artist = "T.I." in 548
replace rank = 10 in 548
replace month = 78 in 548

replace title = "Ms. New Booty" in 549
replace artist = "Bubba Sparxxx" in 549
replace rank = 12 in 549
replace month = 78 in 549

replace title = "Gimme That" in 550
replace artist = "Chris Brown" in 550
replace rank = 17 in 550
replace month = 78 in 550

replace title = "It's Goin' Down" in 551
replace artist = "Yung Joc" in 551
replace rank = 4 in 551
replace month = 79 in 551

replace title = "Ridin'" in 552
replace artist = "Chamillionaire" in 552
replace rank = 5 in 552
replace month= 79 in 552

replace title = "Snap Yo Fingers" in 553
replace artist = "Lil Jon" in 553
replace rank = 10 in 553
replace month = 79 in 553

replace title = "Where'd You Go" in 554
replace artist = "Fort Minor" in 554
replace rank = 12 in 554
replace month = 79 in 554

replace title = "So What" in 555
replace artist = "Field Mob" in 555
replace rank = 16 in 555
replace month = 79 in 555

replace title = "Gimme That" in 556
replace artist = "Chris Brown" in 556
replace rank = 18 in 556
replace month = 79 in 556

replace title = "Temperature" in 557
replace artist = "Sean Paul" in 557
replace rank = 20 in 557
replace month = 79 in 557

replace title = "Snap Yo Fingers" in 558
replace artist = "Lil Jon" in 558
replace rank = 10 in 558
replace month = 80 in 558

replace title = "So What" in 559
replace artist = "Field Mob" in 559
replace rank = 12 in 559
replace month = 80 in 559

replace title = "Do It To It" in 560
replace artist = "Cherish" in 560
replace rank = 13 in 560
replace month = 80 in 560

replace title = "Ridin'" in 561
replace artist = "Chamillionaire" in 561
replace rank = 14 in 561
replace month = 80 in 561

replace title = "Shoulder Lean" in 562
replace artist = "Young Dro" in 562
replace rank = 15 in 562
replace month = 80 in 562

replace title = "Bossy" in 563
replace artist = "Kelis" in 563
replace rank = 16 in 563
replace month = 80 in 563

replace title = "(When You Gonna) Give It Up To Me" in 564
replace artist = "Sean Paul" in 564
replace rank = 17 in 564
replace month = 80 in 564

replace title = "U And Dat" in 565
replace artist = "E-40" in 565
replace rank = 18 in 565
replace month = 80 in 565

replace title = "London Bridge" in 566
replace artist = "Fergie" in 566
replace rank = 1 in 566
replace month = 81 in 566

replace title = "(When You Gonna) Give It Up To Me" in 567
replace artist = "Sean Paul" in 567
replace rank = 4 in 567
replace month = 81 in 567

replace title = "Do It To It" in 568
replace artist = "Cherish" in 568
replace rank = 12 in 568
replace month = 81 in 568

replace title = "Shoulder Lean" in 569
replace artist = "Young Dro" in 569
replace rank = 13 in 569
replace month = 81 in 569

replace title = "U And Dat" in 570
replace artist = "E-40" in 570
replace rank = 14 in 570
replace month = 81 in 570

replace title = "Pullin' Me Back" in 571
replace artist = "Chingy" in 571
replace rank = 16 in 571
replace month = 81 in 571

replace title = "I Know You See It" in 572
replace artist = "Yung Joc" in 572
replace rank = 19 in 572
replace month = 81 in 572

replace title = "It's Goin' Down" in 573
replace artist = "Yung Joc" in 573
replace rank = 20 in 573
replace month = 81 in 573

replace title = "Money Maker" in 574
replace artist = "Ludacris" in 574
replace rank = 2 in 574
replace month = 82 in 574

replace title = "London Bridge" in 575
replace artist = "Fergie" in 575
replace rank = 4 in 575
replace month = 82 in 575

replace title = "Chain Hang Low" in 576
replace artist = "Jibbs" in 576
replace rank = 8 in 576
replace month = 82 in 576

replace title = "Pullin' Me Back" in 577
replace artist = "Chingy" in 577
replace rank = 9 in 577
replace month = 82 in 577

replace title = "(When You Gonna) Give It Up To Me" in 578
replace artist = "Sean Paul" in 578
replace rank = 13 in 578
replace month = 82 in 578

replace title = "I Know You See It" in 579
replace artist = "Yung Joc" in 579
replace rank = 17 in 579
replace month = 82 in 579

replace title = "Money Maker" in 580
replace artist = "Ludacris" in 580
replace rank = 1 in 580
replace month = 83 in 580

replace title = "Smack That" in 581
replace artist = "Akon" in 581
replace rank = 2 in 581
replace month = 83 in 581

replace title  = "Come To Me" in 582
replace artist = "Diddy" in 582
replace rank = 9 in 582
replace month = 83 in 582

replace title = "Chain Hang Low" in 583
replace artist = "Jibbs" in 583
replace rank = 11 in 583
replace month = 83 in 583

replace title = "White & Nerdy" in 584
replace artist = "Weird Al Yankovic" in 584
replace rank =15 in 584
replace month = 83 in 584

replace title = "London Bridge" in 585
replace artist = "Fergie" in 585
replace rank = 17 in 585
replace month = 83 in 585

replace title = "Fergalicious" in 586
replace artist = "Fergie" in 586
replace rank = 19 in 586
replace month = 83 in 586

replace title = "I Wanna Love You" in 587
replace artist = "Akon" in 587
replace rank = 1 in 587
replace month = 84 in 587

replace title = "Smack That" in 588
replace artist = "Akon" in 588
replace rank = 2 in 588
replace month = 84 in 588

replace title = "Fergalicious" in 589
replace artist = "Fergie" in 589
replace rank = 5 in 589
replace month = 84 in 589

replace title = "Money Maker" in 590
replace artist = "Ludacris" in 590
replace rank = 7 in 590
replace month = 84 in 590

replace title = "Shortie Like Mine" in 591
replace artist = "Bow Wow" in 591
replace rank = 10 in 591
replace month = 84 in 591

replace title = "Show Me What You Got" in 592
replace artist = "Jay-Z" in 592
replace rank = 13 in 592
replace month = 84 in 592

replace title = "We Fly High" in 593
replace artist = "Jim Jones" in 593
replace rank = 16 in 593
replace month = 84 in 593

replace title = "Walk It Out" in 594
replace artist = "Unk" in 594
replace rank = 18 in 594
replace month =84 in 594

replace words = 4 if title == "Hot Boyz"

replace words = 5 if title == "Forgot About Dre"

replace words = 1 if title == "Wobble Wobble"

replace words = 0 if title == "The Real Slim Shady"

replace words = 21 if title == "Big Pimpin'"

replace words = 0 if title == "Hot Shit"

replace words = 3 if title == "Callin Me"

replace words = 7 if title == "Bounce With Me"

replace words = 2 if title == "Shake Ya Ass"

replace words = 1 if title == "Between Me and You"

replace words = 2 if title == "It Wasn't Me"

replace words = 1 if title == "E.I."

replace words = 2 if title == "I Just Wanna Love U (Give It To Me)"

replace words = 9 if title == "What's Your Fantasy"

replace words = 0 if title == "Ms. Jackson"

replace words = 1 if title == "Danger (Been So Long)"

replace words = 0 if title == "Put It On Me"

replace words = 0 if title == "Angel"

replace words = 1 if title == "Butterfly"

replace words = 3 if title == "Southern Hospitality"

replace words = 0 if title == "Ride Wit Me"

replace words = 1 if title == "Get Ur Freak On"

replace words = 0 if title == "My Baby"

replace words = 0 if title == "Peaches & Cream"

replace words = 1 if title == "Where The Party At"

replace words = 4 if title == "Purple Hills"

replace words = 0 if title == "Izzo (H.O.V.A.)"

replace words = 1 if title == "One Minute Man"

replace words = 0 if title == "Because I Got High"

replace words = 1 if title == "I'm A Thug"

replace words = 0 if title == "Livin' It Up"

replace words = 5 if title == "Area Codes"

replace words = 0 if title == "I'm Real"

replace words = 1 if title == "Ugly"

replace words = 2 if title == "Can't Deny It"

replace words = 1 if title == "Girls, Girls, Girls"

replace words = 0 if title == "I Do!"

replace words = 1 if title == "#1"

replace words = 3 if title == "Always On Time"

replace words = 0 if title == "In The End"

replace words = 1 if title == "We Thuggin'"

replace words = 0 if title == "Ain't It Funny"

replace words = 3 if title == "Roll Out (My Business)"

replace words = 0 if title == "The Whole World"

replace words = 4 if title == "Lights, Camera, Action!"

replace words = 0 if title == "What's Luv?"

replace words = 0 if title == "I Need A Girl (Part One)"

replace words = 2 if title == "Pass The Courvoisier Part II"

replace words = 2 if title == "Rainy Dayz"

replace words = 1 if title == "Without Me"

replace words = 1 if title == "Hot In Herre"

replace words = 0 if title == "I'm Gonna Be Alright"

replace words = 6 if title == "Down Ass Chick"

replace words = 1 if title == "Stay Fly"

replace words = 1 if title == "Still Fly"

replace words = 1 if title == "Dilemma"

replace words = 0 if title == "I Need A Girl (Part Two)"

replace words = 5 if title == "Down 4 U"

replace words = 5 if title == "Nothin'"

replace words = 16 if title == "Gangsta Lovin'"

replace words = 3 if title == "Cleanin' Out My Closet"

replace words = 0 if title == "Move Bitch"

replace words = 0 if title == "If I Could Go!"

replace words = 0 if title == "Hey Ma"

replace words = 0 if title == "Work It"

replace words = 0 if title == "Trade It All"

replace words = 0 if title == "Luv U Better"

replace words = 7 if title == "Good Times"

replace words = 1 if title == "Lose Yourself"

replace words = 0 if title == "Gimme The Light"

replace words = 1 if title == "Jenny From The Block"

replace words = 2 if title == "Po' Folks"

replace words = 0 if title == "'03 Bonnie & Clyde"

replace words = 0 if title == "Love Of My Life (An Ode To Hip Hop)"

replace words = 4 if title == "Air Force Ones"

replace words = 0 if title == "Bump, Bump, Bump"

replace words = 0 if title == "All I Have"

replace words = 3 if title == "Thugz Mansion"

replace words = 1 if title == "Mesmerize"

replace words = 2 if title == "In Da Club"

replace words = 1 if title == "Gossip Folks"

replace words = 4 if title == "Wanksta"

replace words = 0 if title == "Superman"

replace words = 0 if title == "Get Busy"

replace words = 1 if title == "Excuse Me Miss"

replace words = 2 if title == "Beautiful"

replace words = 0 if title == "I Know What You Want"

replace words = 3 if title == "I Can"

replace words = 7 if title == "Hell Yeah"

replace words = 3 if title == "Can't Let You Go"

replace words = 1 if title == "The Jump Off"

replace words = 0 if title == "Right Thurr"

replace words = 0 if title == "Crazy In Love"

replace words = 0 if title == "21 Questions"

replace words = 5 if title == "Sing For The Moment"

replace words = 2 if title == "Magic Stick"

replace words = 3 if title == "P.I.M.P."

replace words = 1 if title == "Into You"

replace words = 0 if title == "Get Low"

replace words = 0 if title == "Like Glue"

replace words = 0 if title == "Shake Ya Tailfeather"

replace words = 0 if title == "Frontin'"

replace words = 0 if title == "Baby Boy"

replace words = 3 if title == "Let's Get Down"

replace words = 3 if title == "Damn!"

replace words = 2 if title == "Stand Up"

replace words = 5 if title == "Can't Stop, Won't Stop"

replace words = 3 if title == "Holidae In"

replace words = 0 if title == "Suga Suga"

replace words = 0 if title == "The Way You Move"

replace words = 1 if title == "Hey Ya!"

replace words = 0 if title == "Stunt 101"

replace words = 2 if title == "Change Clothes"

replace words = 0 if title == "Wad Da Hook Gon Be"

replace words = 6 if title == "Runnin (Dying To Live)"

replace words = 2 if title == "Slow Jamz"

replace words = 0 if title == "Yeah!"

replace words = 4 if title == "Salt Shaker"

replace words = 1 if title == "Through The Wire"

replace words = 0 if title == "Hotel"

replace words = 0 if title == "One Call Away"

replace words = 0 if title == "Tipsy"

replace words = 0 if title == "Splash Waterfalls"

replace words = 6 if title == "Dirt Off Your Shoulder"

replace words = 0 if title == "Wanna Get To Know You"

replace words = 0 if title == "I'm Still In Love With You"

replace words = 0 if title == "My Band"

replace words = 0 if title == "All Falls Down"

replace words = 0 if title == "Freek-A-Leek"

replace words = 3 if title == "Overnight Celebrity"

replace words = 1 if title == "Game Over (Flip)"

replace words = 0 if title == "Roses"

replace words = 0 if title == "Slow Motion"

replace words = 1 if title == "On Fire"

replace words = 4 if title == "Jesus Walks"

replace words = 4 if title == "Lean Back"

replace words = 0 if title == "Sunshine"

replace words = 2 if title == "I Like That"

replace words = 0 if title == "My Place"

replace words = 3 if title == "Why?"

replace words = 0 if title == "Locked Up"

replace words = 0 if title == "Headsprung"

replace words = 10 if title == "Drop It Like It's Hot"

replace words = 0 if title == "Over and Over"

replace words = 1 if title == "Just Lose It"

replace words = 4 if title == "Let's Go"

replace words = 0 if title == "Oye Mi Canto"

replace words = 6 if title == "Go D.J."

replace words = 2 if title == "Breathe"

replace words = 4 if title == "Wonderful"

replace words = 0 if title == "1, 2 Step"

replace words = 2 if title == "Lovers and Friends"

replace words = 1 if title == "Shorty Wanna Ride"

replace words = 1 if title == "Soldier"

replace words = 0 if title == "Disco Inferno"

replace words = 0 if title == "Get Back"

replace words = 4 if title == "How We Do"

replace words = 0 if title == "Karma"

replace words = 3 if title == "Bring Em Out"

replace words = 1 if title == "Mockingbird"

replace words = 0 if title == "Candy Shop"

replace words = 4 if title == "Hate It Or Love It"

replace words = 2 if title == "Some Cut"

replace words = 4 if title == "Oh"

replace words = 0 if title == "Just A Lil Bit"

replace words = 0 if title == "Switch"

replace words = 2 if title == "Don't Phunk With My Heart"

replace words = 1 if title == "Feel Good Inc"

replace words = 0 if title == "Wait (The Whisper Song)"

replace words = 0 if title == "Get It Poppin'"

replace words = 0 if title == "Lose Control"

replace words = 0 if title == "Let Me Hold You"

replace words = 12 if title == "Pimpin' All Over The World"

replace words = 0 if title == "Like You"

replace words = 0 if title == "Don't Lie"

replace words = 0 if title == "Gold Digger"

replace words = 0 if title == "My Humps"

replace words = 1 if title == "Outta Control (Remix)"

replace words = 1 if title == "Play"

replace words = 0 if title =="Run It!"

replace words = 2 if title == "Soul Survivor"

replace words = 1 if title == "We Be Burnin'"

replace words = 1 if title == "Your Body"

replace words = 0 if title == "I'm Sprung"

replace words = 0 if title == "Girl Tonite"

replace words = 0 if title == "Laffy Taffy"

replace words = 3 if title == "I Think They Like Me"

replace words = 0 if title == "There It Go! (The Whistle Song)"

replace words = 2 if title == "Window Shopper"

replace words = 1 if title == "Grillz"

replace words = 1 if title == "Check On It"

replace words = 2 if title == "When I'm Gone"

replace words = 0 if title == "Temperature"

replace words = 0 if title == "I'm N Luv (Wit A Stripper)"

replace words = 0 if title == "Shake That"

replace words = 4 if title == "Lean Wit It, Rock Wit It"

replace words = 0 if title == "Pump It"

replace words = 0 if title == "Ms. New Booty"

replace words = 0 if title == "Touch It"

replace words = 4 if title == "What You Know"

replace words = 5 if title == "Ridin'"

replace words = 1 if title == "Control Myself"

replace words = 0 if title == "Where'd You Go"

replace words = 0 if title == "Snap Yo Fingers"

replace words = 0 if title == "Gimme That"

replace words = 0 if title == "It's Goin' Down"

replace words = 2 if title == "So What"

replace words = 4 if title == "Do It To It"

replace words = 6 if title == "Shoulder Lean"

replace words = 0 if title == "Bossy"

replace words = 0 if title == "(When You Gonna) Give It Up To Me"

replace words = 4 if title == "U And Dat"

replace words = 0 if title == "London Bridge"

replace words = 0 if title == "Pullin' Me Back"

replace words = 0 if title == "I Know You See It"

replace words = 1 if title == "Money Maker"

replace words = 1 if title == "Chain Hang Low"

replace words = 0 if title == "Smack That"

replace words = 0 if title == "Come To Me"

replace words = 6 if title == "White & Nerdy"

replace words = 1 if title == "I Wanna Love You"

replace words = 0 if title == "Fergalicious"

replace words = 2 if title == "Shortie Like Mine"

replace words = 1 if title == "Show Me What You Got"

replace words = 2 if title == "We Fly High"

replace words = 1 if title == "Walk It Out"

gen weight = 1/sqrt(rank)

gen enc_viol = weight*words

twoway (scatter enc_viol month)

total enc_viol, over(month)

gen evm = .

replace evm = 1.511858 if month == 1

replace evm = 1.414214 if month == 2

replace evm = 1.206045 if month == 3

replace evm = 0 if month == 4

replace evm = .2425356  if month == 5

replace evm = 0 if month == 6

replace evm = 0  if month == 7

replace evm = 0 if month == 8

replace evm = 0 if month ==9

replace evm = 2.0816458 if month == 10

replace evm = .8047002 if month == 11

replace evm = 1.3585482 if month == 12

replace evm = 1.961467 if month == 13

replace evm = 2.758933  if month == 14

replace evm = 1.945141 if month == 15

replace evm = 1 if month == 16

replace evm = .3015113 if month == 17

replace evm = .3333333 if month == 18

replace evm = 0 if month == 19

replace evm = 1.442781 if month == 20

replace evm = .650784 if month == 21

replace evm =  1.078085  if month == 22

replace evm = .5744267  if month == 23

replace evm = .2425356 if month == 24

replace evm =  1.577343 if month == 25

replace evm = 2.459658 if month == 26

replace evm = 4 if month == 27

replace evm = 1 if month == 28

replace evm = .9714045 if month == 29

replace evm =  1.822394 if month == 30

replace evm = 1.995782 if month == 31

replace evm =  5.167705 if month == 32

replace evm = 13.79994  if month == 33

replace evm = 12.82503 if month == 34

replace evm = 8.48908 if month == 35

replace evm = 3.143773 if month == 36

replace evm = 4.444862 if month == 37

replace evm = 2.950845 if month == 38

replace evm = 4.35196 if month == 39

replace evm = 6.793638  if month == 40

replace evm = 5.975149 if month == 41

replace evm = 3.332605 if month == 42

replace evm = 1.83205 if month == 43

replace evm = 2.401155 if month == 44

replace evm = 2.65432 if month == 45

replace evm = 4.308539 if month == 46

replace evm = 5.052119 if month == 47

replace evm = 6.906786 if month == 48

replace evm = 5.964186 if month == 49

replace evm = 4.030499 if month == 50

replace evm = 4.649575 if month == 51

replace evm = 2.698671 if month == 52

replace evm = 3.013392 if month == 53

replace evm = 3.009641 if month == 54

replace evm = 2.267261 if month == 55

replace evm = 4.337408 if month == 56

replace evm = 6.221777 if month == 57

replace evm = 4.074428 if month == 58

replace evm = 10.10173 if month == 59

replace evm = 13.57978 if month == 60

replace evm = 11.9125 if month == 61

replace evm = 8.995532 if month == 62

replace evm = 6.595089 if month == 63

replace evm = 4.355476 if month == 64

replace evm = 5.088686 if month == 65

replace evm = 5.079357 if month == 66

replace evm = 2.511858 if month == 67

replace evm = 5.927249 if month == 68

replace evm = 3.714102 if month == 69

replace evm = 1.407392 if month == 70

replace evm = 1.766591 if month == 71

replace evm = 2.852714 if month == 72

replace evm = 2.934371 if month == 73

replace evm = 1.707107 if month == 74

replace evm = 2.783396 if month == 75

replace evm = 2.116761 if month == 76

replace evm = 6.729507 if month == 77

replace evm = 6.264911 if month == 78

replace evm = 2.736068 if month == 79

replace evm = 5.515059 if month == 80

replace evm = 3.887846 if month == 81

replace evm = 1.06066 if month == 82

replace evm = 2.850705 if month == 83

replace evm = 3.023472 if month == 84

twoway (line evm month)

gen viol = .

replace viol = 109670.253 if month == 1

replace viol = 105397.386 if month == 2

replace viol = 119640.276 if month == 3

replace viol = 118215.987 if month == 4

replace viol = 131034.588 if month == 5

replace viol = 122488.854 if month == 6

replace viol = 128186.01 if month == 7

replace viol = 126761.721 if month == 8

replace viol = 122488.854 if month == 9 

replace viol = 123913.143 if month == 10

replace viol = 108245.964 if month == 11

replace viol = 109670.253 if month == 12

replace viol = 109182.436 if month == 13

replace viol = 100562.77 if month == 14

replace viol = 119238.713 if month == 15

replace viol = 122111.935 if month == 16

replace viol = 129294.99 if month == 17

replace viol = 123548.546 if month == 18

replace viol = 129294.99 if month == 19

replace viol = 124985.157 if month == 20

replace viol = 126421.768 if month == 21

replace viol = 127858.379 if month == 22

replace viol = 113492.269 if month == 23

replace viol = 113492.269 if month == 24

replace viol = 112679.675 if month == 25

replace viol = 95563.775 if month == 26

replace viol = 112679.675 if month == 27

replace viol = 115532.325 if month == 28

replace viol = 124090.275 if month == 29

replace viol = 125516.6 if month == 30

replace viol = 132648.225 if month == 31

replace viol = 132648.225 if month == 32

replace viol = 131221.9 if month == 33

replace viol = 122663.95 if month == 34

replace viol = 109827.025 if month == 35

replace viol = 109827.025 if month == 36

replace viol = 107738.202 if month == 37

replace viol = 89781.835 if month == 38

replace viol = 113263.238 if month == 39

replace viol = 114644.497 if month == 40

replace viol = 122932.051 if month == 41

replace viol = 121550.792 if month == 42

replace viol = 127075.828 if month == 43

replace viol = 127075.828 if month == 44

replace viol = 118788.274 if month == 45

replace viol = 121550.792 if month == 46

replace viol = 109119.461 if month == 47

replace viol = 106356.943 if month == 48

replace viol = 106626.702 if month == 49

replace viol = 95690.63 if month == 50

replace viol = 113461.747 if month == 51

replace viol = 112094.738 if month == 52

replace viol = 123030.81 if month == 53

replace viol = 117562.774 if month == 54

replace viol = 125764.828 if month == 55

replace viol = 123030.81 if month == 56

replace viol = 116195.765 if month == 57

replace viol = 117562.774 if month == 58

replace viol = 106626.702 if month == 59

replace viol = 107993.711 if month == 60

replace viol = 109864.905 if month == 61

replace viol = 98739.345 if month == 62

replace viol = 112646.295 if month == 63

replace viol = 112646.295 if month == 64

replace viol = 122381.16 if month == 65

replace viol = 119599.77 if month == 66

replace viol = 126553.245 if month == 67

replace viol = 126553.245 if month == 68

replace viol = 119599.77 if month == 69

replace viol = 120990.465 if month == 70

replace viol = 108474.21 if month == 71

replace viol = 109864.905 if month == 72

replace viol = 112001.855 if month == 73

replace viol = 100659.895 if month == 74

replace viol = 114837.345 if month == 75

replace viol = 114837.345 if month == 76

replace viol = 124761.56 if month == 77

replace viol = 121926.07 if month == 78

replace viol = 129014.795 if month == 79

replace viol = 129014.795 if month == 80

replace viol = 121926.07 if month == 81

replace viol = 123343.815 if month == 82

replace viol = 110584.11 if month == 83

replace viol = 112001.855 if month == 84

gen ln_viol = log(viol)

gen ln_evm = log(evm)
replace ln_evm = 0 in 5
replace ln_evm = 0 in 6
replace ln_evm = 0 in 7
replace ln_evm = 0 in 8
replace ln_evm = 0 in 47
replace ln_evm = 0 in 48
replace ln_evm = 0 in 49
replace ln_evm = 0 in 171
replace ln_evm = 0 in 393

reg ln_viol ln_evm

twoway (line viol month)


gen jan = 0
replace jan = 1 if month == 1
replace jan = 1 if month == 13
replace jan = 1 if month == 25
replace jan = 1 if month == 37
replace jan = 1 if month == 49
replace jan = 1 if month == 61
replace jan = 1 if month == 73

gen feb = 0
replace feb = 1 if month == 2
replace feb = 1 if month == 14
replace feb = 1 if month == 26
replace feb = 1 if month == 38
replace feb = 1 if month == 50
replace feb = 1 if month == 62
replace feb = 1 if month == 74

gen mar = 0
replace mar = 1 if month == 3
replace mar = 1 if month == 15
replace mar = 1 if month == 27
replace mar = 1 if month == 39
replace mar = 1 if month == 51
replace mar = 1 if month == 63
replace mar = 1 if month == 75

gen apr = 0
replace apr = 1 if month == 4
replace apr = 1 if month == 16
replace apr = 1 if month == 28
replace apr = 1 if month == 40
replace apr = 1 if month == 52
replace apr = 1 if month == 64
replace apr = 1 if month == 76

gen may = 0
replace may = 1 if month == 5
replace may = 1 if month == 17
replace may = 1 if month == 29
replace may = 1 if month == 41
replace may = 1 if month == 53
replace may = 1 if month == 65
replace may = 1 if month == 77

gen jun = 0
replace jun = 1 if month == 6
replace jun = 1 if month == 18
replace jun = 1 if month == 30
replace jun = 1 if month == 42
replace jun = 1 if month == 54
replace jun = 1 if month == 66
replace jun = 1 if month == 78

gen jul = 0
replace jul = 1 if month == 7
replace jul = 1 if month == 19
replace jul = 1 if month == 31
replace jul = 1 if month == 43
replace jul = 1 if month == 55
replace jul = 1 if month == 67
replace jul = 1 if month == 79

gen aug = 0
replace aug = 1 if month == 8
replace aug = 1 if month == 20
replace aug = 1 if month == 32
replace aug = 1 if month == 44
replace aug = 1 if month == 56
replace aug = 1 if month == 68
replace aug = 1 if month == 80

gen sep = 0
replace sep = 1 if month == 9
replace sep = 1 if month == 21
replace sep = 1 if month == 33
replace sep = 1 if month == 45
replace sep = 1 if month == 57
replace sep = 1 if month == 69
replace sep = 1 if month == 81

gen oct = 0
replace oct = 1 if month == 10
replace oct = 1 if month == 22
replace oct = 1 if month == 34
replace oct = 1 if month == 46
replace oct = 1 if month == 58
replace oct = 1 if month == 70
replace oct = 1 if month == 82

gen nov = 0
replace nov = 1 if month == 11
replace nov = 1 if month == 23
replace nov = 1 if month == 35
replace nov = 1 if month == 47
replace nov = 1 if month == 59
replace nov = 1 if month == 71
replace nov = 1 if month == 83

gen dc = 0
replace dc = 1 if month == 12
replace dc = 1 if month == 24
replace dc = 1 if month == 36
replace dc = 1 if month == 48
replace dc = 1 if month == 60
replace dc = 1 if month == 72
replace dc = 1 if month == 84



gen pct_white = 0
replace pct_white = .751 if month == 1
replace pct_white = .751 if month == 2
replace pct_white = .751 if month == 3
replace pct_white = .751 if month == 4
replace pct_white = .751 if month == 5
replace pct_white = .751 if month == 6
replace pct_white = .751 if month == 7
replace pct_white = .751 if month == 8
replace pct_white = .751 if month == 9
replace pct_white = .751 if month == 10
replace pct_white = .751 if month == 11
replace pct_white = .751 if month == 12
replace pct_white = .81 if month == 13
replace pct_white = .81 if month == 14
replace pct_white = .81 if month == 15
replace pct_white = .81 if month == 16
replace pct_white = .81 if month == 17
replace pct_white = .81 if month == 18
replace pct_white = .81 if month == 19
replace pct_white = .81 if month == 20
replace pct_white = .81 if month == 21
replace pct_white = .81 if month == 22
replace pct_white = .81 if month == 23
replace pct_white = .81 if month == 24
replace pct_white = .807 if month == 25
replace pct_white = .807 if month == 26
replace pct_white = .807 if month == 27
replace pct_white = .807 if month == 28
replace pct_white = .807 if month == 29
replace pct_white = .807 if month == 30
replace pct_white = .807 if month == 31
replace pct_white = .807 if month == 32
replace pct_white = .807 if month == 33
replace pct_white = .807 if month == 34
replace pct_white = .807 if month == 35
replace pct_white = .807 if month == 36
replace pct_white = .811 if month == 37
replace pct_white = .811 if month == 38
replace pct_white = .811 if month == 39
replace pct_white = .811 if month == 40
replace pct_white = .811 if month == 41
replace pct_white = .811 if month == 42
replace pct_white = .811 if month == 43
replace pct_white = .811 if month == 44
replace pct_white = .811 if month == 45
replace pct_white = .811 if month == 46
replace pct_white = .811 if month == 47
replace pct_white = .811 if month == 48
replace pct_white = .804 if month == 49
replace pct_white = .804 if month == 50
replace pct_white = .804 if month == 51
replace pct_white = .804 if month == 52
replace pct_white = .804 if month == 53
replace pct_white = .804 if month == 54
replace pct_white = .804 if month == 55
replace pct_white = .804 if month == 56
replace pct_white = .804 if month == 57
replace pct_white = .804 if month == 58
replace pct_white = .804 if month == 59
replace pct_white = .804 if month == 60
replace pct_white = .802 if month == 61
replace pct_white = .802 if month == 62
replace pct_white = .802 if month == 63
replace pct_white = .802 if month == 64
replace pct_white = .802 if month == 65
replace pct_white = .802 if month == 66
replace pct_white = .802 if month == 67
replace pct_white = .802 if month == 68
replace pct_white = .802 if month == 69
replace pct_white = .802 if month == 70
replace pct_white = .802 if month == 71
replace pct_white = .802 if month == 72
replace pct_white = .801 if month == 73
replace pct_white = .801 if month == 74
replace pct_white = .801 if month == 75
replace pct_white = .801 if month == 76
replace pct_white = .801 if month == 77
replace pct_white = .801 if month ==78
replace pct_white = .801 if month == 79
replace pct_white = .801 if month == 80
replace pct_white = .801 if month == 81
replace pct_white = .801 if month == 82
replace pct_white = .801 if month == 83
replace pct_white = .801 if month == 84

gen pct_black = 0
replace pct_black = .123 if month == 1
replace pct_black = .123 if month == 2
replace pct_black = .123 if month == 3
replace pct_black = .123 if month == 4
replace pct_black = .123 if month == 5
replace pct_black = .123 if month == 6
replace pct_black = .123 if month == 7
replace pct_black = .123 if month == 8
replace pct_black = .123 if month == 9
replace pct_black = .123 if month == 10
replace pct_black = .123 if month == 11
replace pct_black = .123 if month == 12
replace pct_black = .127 if month == 13
replace pct_black = .127 if month == 14
replace pct_black = .127 if month == 15
replace pct_black = .127 if month == 16
replace pct_black = .127 if month == 17
replace pct_black = .127 if month == 18
replace pct_black = .127 if month == 19
replace pct_black = .127 if month == 20
replace pct_black = .127 if month == 21
replace pct_black = .127 if month == 22
replace pct_black = .127 if month == 23
replace pct_black = .127 if month == 24
replace pct_black = .128 if month == 25
replace pct_black = .128 if month == 26
replace pct_black = .128 if month == 27
replace pct_black = .128 if month == 28
replace pct_black = .128 if month == 29
replace pct_black = .128 if month == 30
replace pct_black = .128 if month == 31
replace pct_black = .128 if month == 32
replace pct_black = .128 if month == 33
replace pct_black = .128 if month == 34
replace pct_black = .128 if month == 35
replace pct_black = .128 if month == 36
replace pct_black = .127 if month == 37
replace pct_black = .127 if month == 38
replace pct_black = .127 if month == 39
replace pct_black = .127 if month == 40
replace pct_black = .127 if month == 41
replace pct_black = .127 if month == 42
replace pct_black = .127 if month == 43
replace pct_black = .127 if month == 44
replace pct_black = .127 if month == 45
replace pct_black = .127 if month == 46
replace pct_black = .127 if month == 47
replace pct_black = .127 if month == 48
replace pct_black = .128 if month == 49
replace pct_black = .128 if month == 50
replace pct_black = .128 if month == 51
replace pct_black = .128 if month == 52
replace pct_black = .128 if month == 53
replace pct_black = .128 if month == 54
replace pct_black = .128 if month == 55
replace pct_black = .128 if month == 56
replace pct_black = .128 if month == 57
replace pct_black = .128 if month == 58
replace pct_black = .128 if month == 59
replace pct_black = .128 if month == 60
replace pct_black = .128 if month == 61
replace pct_black = .128 if month == 62
replace pct_black = .128 if month == 63
replace pct_black = .128 if month ==64
replace pct_black = .128 if month == 65
replace pct_black = .128 if month == 66
replace pct_black = .128 if month == 67
replace pct_black = .128 if month == 68
replace pct_black = .128 if month == 69
replace pct_black = .128 if month == 70
replace pct_black = .128 if month == 71
replace pct_black = .128 if month == 72
replace pct_black = .128 if month == 73
replace pct_black = .128 if month == 74
replace pct_black = .128 if month == 75
replace pct_black = .128 if month == 76
replace pct_black = .128 if month == 77
replace pct_black = .128 if month == 78
replace pct_black = .128 if month == 79
replace pct_black = .128 if month == 80
replace pct_black = .128 if month == 81
replace pct_black = .128 if month == 82
replace pct_black = .128 if month == 83
replace pct_black = .128 if month == 84

gen pct_native = 0
replace pct_native = .009 if month == 1
replace pct_native = .009 if month == 2
replace pct_native = .009 if month == 3
replace pct_native = .009 if month == 4
replace pct_native = .009 if month == 5
replace pct_native = .009 if month == 6
replace pct_native = .009 if month == 7
replace pct_native = .009 if month == 8
replace pct_native = .009 if month == 9
replace pct_native = .009 if month == 10
replace pct_native = .009 if month == 11
replace pct_native = .009 if month == 12
replace pct_native = .009 if month == 13
replace pct_native = .009 if month == 14
replace pct_native = .009 if month == 15
replace pct_native = .009 if month == 16
replace pct_native = .009 if month == 17
replace pct_native = .009 if month == 18
replace pct_native = .009 if month == 19
replace pct_native = .009 if month == 20
replace pct_native = .009 if month == 21
replace pct_native = .009 if month == 22
replace pct_native = .009 if month == 23
replace pct_native = .009 if month == 24
replace pct_native = .01 if month == 25
replace pct_native = .01 if month == 26
replace pct_native = .01 if month == 27
replace pct_native = .01 if month == 28
replace pct_native = .01 if month == 29
replace pct_native = .01 if month == 30
replace pct_native = .01 if month == 31
replace pct_native = .01 if month == 32
replace pct_native = .01 if month == 33
replace pct_native = .01 if month == 34
replace pct_native = .01 if month == 35
replace pct_native = .01 if month == 36
replace pct_native = .009 if month == 37
replace pct_native = .009 if month == 38
replace pct_native = .009 if month == 39
replace pct_native = .009 if month == 40
replace pct_native = .009 if month == 41
replace pct_native = .009 if month == 42
replace pct_native = .009 if month == 43
replace pct_native = .009 if month == 44
replace pct_native = .009 if month == 45
replace pct_native = .009 if month == 46
replace pct_native = .009 if month == 47
replace pct_native = .009 if month == 48
replace pct_native = .01 if month == 49
replace pct_native = .01 if month == 50
replace pct_native = .01 if month == 51
replace pct_native = .01 if month == 52
replace pct_native = .01 if month == 53
replace pct_native = .01 if month == 54
replace pct_native = .01 if month == 55
replace pct_native = .01 if month == 56
replace pct_native = .01 if month == 57
replace pct_native = .01 if month == 58
replace pct_native = .01 if month == 59
replace pct_native = .01 if month == 60
replace pct_native = .01 if month == 61
replace pct_native = .01 if month == 62
replace pct_native = .01 if month == 63
replace pct_native = .01 if month == 64
replace pct_native = .01 if month == 65
replace pct_native = .01 if month == 66
replace pct_native = .01 if month == 67
replace pct_native = .01 if month == 68
replace pct_native = .01 if month == 69
replace pct_native = .01 if month == 70
replace pct_native = .01 if month == 71
replace pct_native = .01 if month == 72
replace pct_native = .01 if month == 73
replace pct_native = .01 if month == 74
replace pct_native = .01 if month == 75
replace pct_native = .01 if month == 76
replace pct_native = .01 if month == 77
replace pct_native = .01 if month == 78
replace pct_native = .01 if month == 79
replace pct_native = .01 if month == 80
replace pct_native = .01 if month == 81
replace pct_native = .01 if month == 82
replace pct_native = .01 if month == 83
replace pct_native = .01 if month == 84

gen pct_asian = 0
replace pct_asian = .036 if month == 1
replace pct_asian = .036 if month == 2
replace pct_asian = .036 if month == 3
replace pct_asian = .036 if month ==4
replace pct_asian = .036 if month == 5
replace pct_asian = .036 if month == 6
replace pct_asian = .036 if month == 7
replace pct_asian = .036 if month == 8
replace pct_asian = .036 if month == 9
replace pct_asian = .036 if month == 10
replace pct_asian = .036 if month == 11
replace pct_asian = .036 if month == 12
replace pct_asian = .038 if month == 13
replace pct_asian = .038 if month == 14
replace pct_asian = .038 if month == 15
replace pct_asian = .038 if month == 16
replace pct_asian = .038 if month == 17
replace pct_asian = .038 if month == 18
replace pct_asian = .038 if month == 19
replace pct_asian = .038 if month == 20
replace pct_asian = .038 if month == 21
replace pct_asian = .038 if month == 22
replace pct_asian = .038 if month == 23
replace pct_asian = .038 if month == 24
replace pct_asian = .04 if month == 25
replace pct_asian = .04 if month == 26
replace pct_asian = .04 if month == 27
replace pct_asian = .04 if month == 28
replace pct_asian = .04 if month == 29
replace pct_asian = .04 if month == 30
replace pct_asian = .04 if month == 31
replace pct_asian = .04 if month == 32
replace pct_asian = .04 if month == 33
replace pct_asian = .04 if month == 34
replace pct_asian = .04 if month == 35
replace pct_asian = .04 if month == 36
replace pct_asian = .038 if month == 37
replace pct_asian = .038 if month == 38
replace pct_asian = .038 if month == 39
replace pct_asian = .038 if month == 40
replace pct_asian = .038 if month == 41
replace pct_asian = .038 if month == 42
replace pct_asian = .038 if month == 43
replace pct_asian = .038 if month == 44
replace pct_asian = .038 if month == 45
replace pct_asian = .038 if month == 46
replace pct_asian = .038 if month == 47
replace pct_asian = .038 if month == 48
replace pct_asian = .042 if month == 49
replace pct_asian = .042 if month == 50
replace pct_asian = .042 if month == 51
replace pct_asian = .042 if month == 52
replace pct_asian = .042 if month == 53
replace pct_asian = .042 if month == 54
replace pct_asian = .042 if month == 55
replace pct_asian = .042 if month == 56
replace pct_asian = .042 if month == 57
replace pct_asian = .042 if month == 58
replace pct_asian = .042 if month == 59
replace pct_asian = .042 if month == 60
replace pct_asian = .043 if month == 61
replace pct_asian = .043 if month == 62
replace pct_asian = .043 if month == 63
replace pct_asian = .043 if month == 64
replace pct_asian = .043 if month == 65
replace pct_asian = .043 if month == 66
replace pct_asian = .043 if month == 67
replace pct_asian = .043 if month == 68
replace pct_asian = .043 if month == 69
replace pct_asian = .043 if month == 70
replace pct_asian = .043 if month == 71
replace pct_asian = .043 if month == 72
replace pct_asian = .044 if month == 73
replace pct_asian = .044 if month == 74
replace pct_asian = .044 if month == 75
replace pct_asian = .044 if month == 76
replace pct_asian = .044 if month == 77
replace pct_asian = .044 if month == 78
replace pct_asian = .044 if month == 79
replace pct_asian = .044 if month == 80
replace pct_asian = .044 if month == 81
replace pct_asian = .044 if month == 82
replace pct_asian = .044 if month == 83
replace pct_asian = .044 if month == 84

gen pct_pacific = 0
replace pct_pacific = .001 if month == 1
replace pct_pacific = .001 if month == 2
replace pct_pacific = .001 if month == 3
replace pct_pacific = .001 if month == 4
replace pct_pacific = .001 if month == 5
replace pct_pacific = .001 if month == 6
replace pct_pacific = .001 if month == 7
replace pct_pacific = .001 if month == 8
replace pct_pacific = .001 if month == 9
replace pct_pacific = .001 if month == 10
replace pct_pacific = .001 if month == 11
replace pct_pacific = .001 if month == 12
replace pct_pacific = .002 if month == 13
replace pct_pacific = .002 if month == 14
replace pct_pacific = .002 if month == 15
replace pct_pacific = .002 if month == 16
replace pct_pacific = .002 if month == 17
replace pct_pacific = .002 if month == 18
replace pct_pacific = .002 if month == 19
replace pct_pacific = .002 if month == 20
replace pct_pacific = .002 if month == 21
replace pct_pacific = .002 if month == 22
replace pct_pacific = .002 if month == 23
replace pct_pacific = .002 if month == 24
replace pct_pacific = .002 if month == 25
replace pct_pacific = .002 if month == 26
replace pct_pacific = .002 if month == 27
replace pct_pacific = .002 if month == 28
replace pct_pacific = .002 if month == 29
replace pct_pacific = .002 if month == 30
replace pct_pacific = .002 if month == 31
replace pct_pacific = .002 if month == 32
replace pct_pacific = .002 if month == 33
replace pct_pacific = .002 if month == 34
replace pct_pacific = .002 if month == 35
replace pct_pacific = .002 if month == 36
replace pct_pacific = .002 if month == 37
replace pct_pacific = .002 if month == 38
replace pct_pacific = .002 if month == 39
replace pct_pacific = .002 if month == 40
replace pct_pacific = .002 if month == 41
replace pct_pacific = .002 if month == 42
replace pct_pacific = .002 if month == 43
replace pct_pacific = .002 if month == 44
replace pct_pacific = .002 if month == 45
replace pct_pacific = .002 if month == 46
replace pct_pacific = .002 if month == 47
replace pct_pacific = .002 if month == 48
replace pct_pacific = .002 if month == 49
replace pct_pacific = .002 if month == 50
replace pct_pacific = .002 if month == 51
replace pct_pacific = .002 if month == 52
replace pct_pacific = .002 if month == 53
replace pct_pacific = .002 if month == 54
replace pct_pacific = .002 if month == 55
replace pct_pacific = .002 if month == 56
replace pct_pacific = .002 if month == 57
replace pct_pacific = .002 if month == 58
replace pct_pacific = .002 if month == 59
replace pct_pacific = .002 if month == 60
replace pct_pacific = .002 if month == 61
replace pct_pacific = .002 if month == 62
replace pct_pacific = .002 if month == 63
replace pct_pacific = .002 if month == 64
replace pct_pacific = .002 if month == 65
replace pct_pacific = .002 if month == 66
replace pct_pacific = .002 if month == 67
replace pct_pacific = .002 if month == 68
replace pct_pacific = .002 if month == 69
replace pct_pacific = .002 if month == 70
replace pct_pacific = .002 if month == 71
replace pct_pacific = .002 if month == 72
replace pct_pacific = .002 if month == 73
replace pct_pacific = .002 if month == 74
replace pct_pacific = .002 if month == 75
replace pct_pacific = .002 if month == 76
replace pct_pacific = .002 if month == 77
replace pct_pacific = .002 if month == 78
replace pct_pacific = .002 if month == 79
replace pct_pacific = .002 if month == 80
replace pct_pacific = .002 if month == 81
replace pct_pacific = .002 if month == 82
replace pct_pacific = .002 if month == 83
replace pct_pacific = .002 if month == 84

gen ln_white = log(pct_white)
gen ln_black = log(pct_black)
gen ln_native = log(pct_native)
gen ln_asian = log(pct_asian)
gen ln_pacific = log(pct_pacific)

gen pct_15_to_19 = 0
replace pct_15_to_19 = .072 if month == 1
replace pct_15_to_19 = .072 if month == 2
replace pct_15_to_19 = .072 if month == 3
replace pct_15_to_19 = .072 if month == 4
replace pct_15_to_19 = .072 if month == 5
replace pct_15_to_19 = .072 if month == 6
replace pct_15_to_19 = .072 if month == 7
replace pct_15_to_19 = .072 if month == 8
replace pct_15_to_19 = .072 if month == 9
replace pct_15_to_19 = .072 if month == 10
replace pct_15_to_19 = .072 if month == 11
replace pct_15_to_19 = .072 if month == 12
replace pct_15_to_19 = .071 if month == 13
replace pct_15_to_19 = .071 if month == 14
replace pct_15_to_19 = .071 if month == 15
replace pct_15_to_19 = .071 if month == 16
replace pct_15_to_19 = .071 if month == 17
replace pct_15_to_19 = .071 if month == 18
replace pct_15_to_19 = .071 if month == 19
replace pct_15_to_19 = .071 if month == 20
replace pct_15_to_19 = .071 if month == 21
replace pct_15_to_19 = .071 if month == 22
replace pct_15_to_19 = .071 if month == 23
replace pct_15_to_19 = .071 if month == 24
replace pct_15_to_19 = .071 if month == 25
replace pct_15_to_19 = .071 if month == 26
replace pct_15_to_19 = .071 if month == 27
replace pct_15_to_19 = .071 if month == 28
replace pct_15_to_19 = .071 if month == 29
replace pct_15_to_19 = .071 if month == 30
replace pct_15_to_19 = .071 if month == 31
replace pct_15_to_19 = .071 if month == 32
replace pct_15_to_19 = .071 if month == 33
replace pct_15_to_19 = .071 if month == 34
replace pct_15_to_19 = .071 if month == 35
replace pct_15_to_19 = .071 if month == 36
replace pct_15_to_19 = .071 if month == 37
replace pct_15_to_19 = .071 if month == 38
replace pct_15_to_19 = .071 if month == 39
replace pct_15_to_19 = .071 if month == 40
replace pct_15_to_19 = .071 if month == 41
replace pct_15_to_19 = .071 if month == 42
replace pct_15_to_19 = .071 if month == 43
replace pct_15_to_19 = .071 if month == 44
replace pct_15_to_19 = .071 if month == 45
replace pct_15_to_19 = .071 if month == 46
replace pct_15_to_19 = .071 if month == 47
replace pct_15_to_19 = .071 if month == 48
replace pct_15_to_19 = .07 if month == 49
replace pct_15_to_19 = .07 if month == 50
replace pct_15_to_19 = .07 if month == 51
replace pct_15_to_19 = .07 if month == 52
replace pct_15_to_19 = .07 if month == 53
replace pct_15_to_19 = .07 if month == 54
replace pct_15_to_19 = .07 if month == 55
replace pct_15_to_19 = .07 if month == 56
replace pct_15_to_19 = .07 if month == 57
replace pct_15_to_19 = .07 if month == 58
replace pct_15_to_19 = .07 if month == 59
replace pct_15_to_19 = .07 if month == 60
replace pct_15_to_19 = .071 if month == 61
replace pct_15_to_19 = .071 if month == 62
replace pct_15_to_19 = .071 if month == 63
replace pct_15_to_19 = .071 if month == 64
replace pct_15_to_19 = .071 if month == 65
replace pct_15_to_19 = .071 if month == 66
replace pct_15_to_19 = .071 if month == 67
replace pct_15_to_19 = .071 if month == 68
replace pct_15_to_19 = .071 if month == 69
replace pct_15_to_19 = .071 if month == 70
replace pct_15_to_19 = .071 if month == 71
replace pct_15_to_19 = .071 if month == 72
replace pct_15_to_19 = .071 if month == 73
replace pct_15_to_19 = .071 if month == 74
replace pct_15_to_19 = .071 if month == 75
replace pct_15_to_19 = .071 if month == 76
replace pct_15_to_19 = .071 if month == 77 
replace pct_15_to_19 = .071 if month == 78
replace pct_15_to_19 = .071 if month == 79
replace pct_15_to_19 = .071 if month == 80
replace pct_15_to_19 = .071 if month == 81
replace pct_15_to_19 = .071 if month == 82
replace pct_15_to_19 = .071 if month == 83
replace pct_15_to_19 = .071 if month == 84

gen pct_20_to_24 = 0
replace pct_20_to_24 = .067 if month == 1
replace pct_20_to_24 = .067 if month == 2
replace pct_20_to_24 = .067 if month == 3
replace pct_20_to_24 = .067 if month == 4
replace pct_20_to_24 = .067 if month == 5
replace pct_20_to_24 = .067 if month == 6
replace pct_20_to_24 = .067 if month == 7
replace pct_20_to_24 = .067 if month == 8
replace pct_20_to_24 = .067 if month == 9
replace pct_20_to_24 = .067 if month == 10
replace pct_20_to_24 = .067 if month == 11
replace pct_20_to_24 = .067 if month == 12
replace pct_20_to_24 = .069 if month == 13
replace pct_20_to_24 = .069 if month == 14
replace pct_20_to_24 = .069 if month == 15
replace pct_20_to_24 = .069 if month == 16
replace pct_20_to_24 = .069 if month == 17
replace pct_20_to_24 = .069 if month == 18
replace pct_20_to_24 = .069 if month == 19
replace pct_20_to_24 = .069 if month == 20
replace pct_20_to_24 = .069 if month == 21
replace pct_20_to_24 = .069 if month == 22
replace pct_20_to_24 = .069 if month == 23
replace pct_20_to_24 = .069 if month == 24
replace pct_20_to_24 = .07 if month == 25
replace pct_20_to_24 = .07 if month == 26
replace pct_20_to_24 = .07 if month == 27
replace pct_20_to_24 = .07 if month == 28
replace pct_20_to_24 = .07 if month == 29
replace pct_20_to_24 = .07 if month == 30
replace pct_20_to_24 = .07 if month == 31
replace pct_20_to_24 = .07 if month == 32
replace pct_20_to_24 = .07 if month == 33
replace pct_20_to_24 = .07 if month == 34
replace pct_20_to_24 = .07 if month == 35
replace pct_20_to_24 = .07 if month == 36
replace pct_20_to_24 = .07 if month == 37
replace pct_20_to_24 = .07 if month == 38
replace pct_20_to_24 = .07 if month == 39
replace pct_20_to_24 = .07 if month == 40
replace pct_20_to_24 = .07 if month == 41
replace pct_20_to_24 = .07 if month == 42
replace pct_20_to_24 = .07 if month == 43
replace pct_20_to_24 = .07 if month == 44
replace pct_20_to_24 = .07 if month == 45
replace pct_20_to_24 = .07 if month == 46
replace pct_20_to_24 = .07 if month == 47
replace pct_20_to_24 = .07 if month == 48
replace pct_20_to_24 = .071 if month == 49
replace pct_20_to_24 = .071 if month == 50
replace pct_20_to_24 = .071 if month == 51
replace pct_20_to_24 = .071 if month == 52
replace pct_20_to_24 = .071 if month == 53
replace pct_20_to_24 = .071 if month == 54
replace pct_20_to_24 = .071 if month == 55
replace pct_20_to_24 = .071 if month == 56
replace pct_20_to_24 = .071 if month == 57
replace pct_20_to_24 = .071 if month == 58
replace pct_20_to_24 = .071 if month == 59
replace pct_20_to_24 = .071 if month == 60
replace pct_20_to_24 = .07 if month == 61
replace pct_20_to_24 = .07 if month == 62
replace pct_20_to_24 = .07 if month == 63
replace pct_20_to_24 = .07 if month == 64
replace pct_20_to_24 = .07 if month == 65
replace pct_20_to_24 = .07 if month == 66
replace pct_20_to_24 = .07 if month == 67
replace pct_20_to_24 = .07 if month == 68
replace pct_20_to_24 = .07 if month == 69
replace pct_20_to_24 = .07 if month == 70
replace pct_20_to_24 = .07 if month == 71
replace pct_20_to_24 = .07 if month == 72
replace pct_20_to_24 = .069 if month == 73
replace pct_20_to_24 = .069 if month == 74
replace pct_20_to_24 = .069 if month == 75
replace pct_20_to_24 = .069 if month == 76
replace pct_20_to_24 = .069 if month == 77 
replace pct_20_to_24 = .069 if month == 78
replace pct_20_to_24 = .069 if month == 79
replace pct_20_to_24 = .069 if month == 80
replace pct_20_to_24 = .069 if month == 81
replace pct_20_to_24 = .069 if month == 82
replace pct_20_to_24 = .069 if month == 83
replace pct_20_to_24 = .069 if month == 84

gen pct_25_to_29 = 0
replace pct_25_to_29 = .069 if month == 1
replace pct_25_to_29 = .069 if month == 2
replace pct_25_to_29 = .069 if month == 3
replace pct_25_to_29 = .069 if month == 4
replace pct_25_to_29 = .069 if month == 5
replace pct_25_to_29 = .069 if month == 6
replace pct_25_to_29 = .069 if month == 7
replace pct_25_to_29 = .069 if month == 8
replace pct_25_to_29 = .069 if month == 9
replace pct_25_to_29 = .069 if month == 10
replace pct_25_to_29 = .069 if month == 11
replace pct_25_to_29 = .069 if month == 12
replace pct_25_to_29 = .066 if month == 13
replace pct_25_to_29 = .066 if month == 14
replace pct_25_to_29 = .066 if month == 15
replace pct_25_to_29 = .066 if month == 16
replace pct_25_to_29 = .066 if month == 17
replace pct_25_to_29 = .066 if month == 18
replace pct_25_to_29 = .066 if month == 19
replace pct_25_to_29 = .066 if month == 20
replace pct_25_to_29 = .066 if month == 21
replace pct_25_to_29 = .066 if month == 22
replace pct_25_to_29 = .066 if month == 23
replace pct_25_to_29 = .066 if month == 24
replace pct_25_to_29 = .066 if month == 25
replace pct_25_to_29 = .066 if month == 26
replace pct_25_to_29 = .066 if month == 27
replace pct_25_to_29 = .066 if month == 28
replace pct_25_to_29 = .066 if month == 29
replace pct_25_to_29 = .066 if month == 30
replace pct_25_to_29 = .066 if month == 31
replace pct_25_to_29 = .066 if month == 32
replace pct_25_to_29 = .066 if month == 33
replace pct_25_to_29 = .066 if month == 34
replace pct_25_to_29 = .066 if month == 35
replace pct_25_to_29 = .066 if month == 36
replace pct_25_to_29 = .065 if month == 37
replace pct_25_to_29 = .065 if month == 38
replace pct_25_to_29 = .065 if month == 39
replace pct_25_to_29 = .065 if month == 40
replace pct_25_to_29 = .065 if month == 41
replace pct_25_to_29 = .065 if month == 42
replace pct_25_to_29 = .065 if month == 43
replace pct_25_to_29 = .065 if month == 44
replace pct_25_to_29 = .065 if month == 45
replace pct_25_to_29 = .065 if month == 46
replace pct_25_to_29 = .065 if month == 47
replace pct_25_to_29 = .065 if month == 48
replace pct_25_to_29 = .066 if month == 49
replace pct_25_to_29 = .066 if month == 50
replace pct_25_to_29 = .066 if month == 51
replace pct_25_to_29 = .066 if month == 52
replace pct_25_to_29 = .066 if month == 53
replace pct_25_to_29 = .066 if month == 54
replace pct_25_to_29 = .066 if month == 55
replace pct_25_to_29 = .066 if month == 56
replace pct_25_to_29 = .066 if month == 57
replace pct_25_to_29 = .066 if month == 58
replace pct_25_to_29 = .066 if month == 59
replace pct_25_to_29 = .066 if month == 60
replace pct_25_to_29 = .067 if month == 61
replace pct_25_to_29 = .067 if month == 62
replace pct_25_to_29 = .067 if month == 63
replace pct_25_to_29 = .067 if month == 64
replace pct_25_to_29 = .067 if month == 65
replace pct_25_to_29 = .067 if month == 66
replace pct_25_to_29 = .067 if month == 67
replace pct_25_to_29 = .067 if month == 68
replace pct_25_to_29 = .067 if month == 69
replace pct_25_to_29 = .067 if month == 70
replace pct_25_to_29 = .067 if month == 71
replace pct_25_to_29 = .067 if month == 72
replace pct_25_to_29 = .069 if month == 73
replace pct_25_to_29 = .069 if month == 74
replace pct_25_to_29 = .069 if month == 75
replace pct_25_to_29 = .069 if month == 76
replace pct_25_to_29 = .069 if month == 77
replace pct_25_to_29 = .069 if month == 78
replace pct_25_to_29 = .069 if month == 79
replace pct_25_to_29 = .069 if month == 80
replace pct_25_to_29 = .069 if month == 81
replace pct_25_to_29 = .069 if month == 82
replace pct_25_to_29 = .069 if month == 83
replace pct_25_to_29 = .069 if month == 84

gen pct_30_to_34 = 0
replace pct_30_to_34 = .073 if month == 1
replace pct_30_to_34 = .073 if month == 2
replace pct_30_to_34 = .073 if month == 3
replace pct_30_to_34 = .073 if month == 4
replace pct_30_to_34 = .073 if month == 5
replace pct_30_to_34 = .073 if month == 6
replace pct_30_to_34 = .073 if month == 7
replace pct_30_to_34 = .073 if month == 8
replace pct_30_to_34 = .073 if month == 9
replace pct_30_to_34 = .073 if month == 10
replace pct_30_to_34 = .073 if month == 11
replace pct_30_to_34 = .073 if month == 12
replace pct_30_to_34 = .073 if month == 13
replace pct_30_to_34 = .073 if month == 14
replace pct_30_to_34 = .073 if month == 15
replace pct_30_to_34 = .073 if month == 16
replace pct_30_to_34 = .073 if month == 17
replace pct_30_to_34 = .073 if month == 18
replace pct_30_to_34 = .073 if month == 19
replace pct_30_to_34 = .073 if month == 20
replace pct_30_to_34 = .073 if month == 21
replace pct_30_to_34 = .073 if month == 22
replace pct_30_to_34 = .073 if month == 23
replace pct_30_to_34 = .073 if month == 24
replace pct_30_to_34 = .073 if month == 25
replace pct_30_to_34 = .073 if month == 26
replace pct_30_to_34 = .073 if month == 27
replace pct_30_to_34 = .073 if month == 28
replace pct_30_to_34 = .073 if month == 29
replace pct_30_to_34 = .073 if month == 30
replace pct_30_to_34 = .073 if month == 31
replace pct_30_to_34 = .073 if month == 32
replace pct_30_to_34 = .073 if month == 33
replace pct_30_to_34 = .073 if month == 34
replace pct_30_to_34 = .073 if month == 35
replace pct_30_to_34 = .073 if month == 36
replace pct_30_to_34 = .072 if month == 37
replace pct_30_to_34 = .072 if month == 38
replace pct_30_to_34 = .072 if month == 39
replace pct_30_to_34 = .072 if month == 40
replace pct_30_to_34 = .072 if month == 41
replace pct_30_to_34 = .072 if month == 42
replace pct_30_to_34 = .072 if month == 43
replace pct_30_to_34 = .072 if month == 44
replace pct_30_to_34 = .072 if month == 45
replace pct_30_to_34 = .072 if month == 46
replace pct_30_to_34 = .072 if month == 47
replace pct_30_to_34 = .072 if month == 48
replace pct_30_to_34 = .07 if month == 49
replace pct_30_to_34 = .07 if month == 50
replace pct_30_to_34 = .07 if month == 51
replace pct_30_to_34 = .07 if month == 52
replace pct_30_to_34 = .07 if month == 53
replace pct_30_to_34 = .07 if month == 54
replace pct_30_to_34 = .07 if month == 55
replace pct_30_to_34 = .07 if month == 56
replace pct_30_to_34 = .07 if month == 57
replace pct_30_to_34 = .07 if month == 58
replace pct_30_to_34 = .07 if month == 59
replace pct_30_to_34 = .07 if month == 60
replace pct_30_to_34 = .068 if month == 61
replace pct_30_to_34 = .068 if month == 62
replace pct_30_to_34 = .068 if month == 63
replace pct_30_to_34 = .068 if month == 64
replace pct_30_to_34 = .068 if month == 65
replace pct_30_to_34 = .068 if month == 66
replace pct_30_to_34 = .068 if month == 67
replace pct_30_to_34 = .068 if month == 68
replace pct_30_to_34 = .068 if month == 69
replace pct_30_to_34 = .068 if month == 70
replace pct_30_to_34 = .068 if month == 71
replace pct_30_to_34 = .068 if month == 72
replace pct_30_to_34 = .066 if month == 73
replace pct_30_to_34 = .066 if month == 74
replace pct_30_to_34 = .066 if month == 75
replace pct_30_to_34 = .066 if month == 76
replace pct_30_to_34 = .066 if month == 77
replace pct_30_to_34 = .066 if month == 78
replace pct_30_to_34 = .066 if month == 79
replace pct_30_to_34 = .066 if month == 80
replace pct_30_to_34 = .066 if month == 81
replace pct_30_to_34 = .066 if month == 82
replace pct_30_to_34 = .066 if month == 83
replace pct_30_to_34 = .066 if month == 84

gen pct_35_to_44 = 0
replace pct_35_to_44 = .161 if month == 1
replace pct_35_to_44 = .161 if month == 2
replace pct_35_to_44 = .161 if month == 3
replace pct_35_to_44 = .161 if month == 4
replace pct_35_to_44 = .161 if month == 5
replace pct_35_to_44 = .161 if month == 6
replace pct_35_to_44 = .161 if month == 7
replace pct_35_to_44 = .161 if month == 8
replace pct_35_to_44 = .161 if month == 9
replace pct_35_to_44 = .161 if month == 10
replace pct_35_to_44 = .161 if month == 11
replace pct_35_to_44 = .161 if month == 12
replace pct_35_to_44 = .158 if month == 13
replace pct_35_to_44 = .158 if month == 14
replace pct_35_to_44 = .158 if month == 15
replace pct_35_to_44 = .158 if month == 16
replace pct_35_to_44 = .158 if month == 17
replace pct_35_to_44 = .158 if month == 18
replace pct_35_to_44 = .158 if month == 19
replace pct_35_to_44 = .158 if month == 20
replace pct_35_to_44 = .158 if month == 21
replace pct_35_to_44 = .158 if month == 22
replace pct_35_to_44 = .158 if month == 23
replace pct_35_to_44 = .158 if month == 24
replace pct_35_to_44 = .156 if month == 25
replace pct_35_to_44 = .156 if month == 26
replace pct_35_to_44 = .156 if month == 27
replace pct_35_to_44 = .156 if month == 28
replace pct_35_to_44 = .156 if month == 29
replace pct_35_to_44 = .156 if month == 30
replace pct_35_to_44 = .156 if month == 31
replace pct_35_to_44 = .156 if month == 32
replace pct_35_to_44 = .156 if month == 33
replace pct_35_to_44 = .156 if month == 34
replace pct_35_to_44 = .156 if month == 35
replace pct_35_to_44 = .156 if month == 36
replace pct_35_to_44 = .154 if month == 37
replace pct_35_to_44 = .154 if month == 38
replace pct_35_to_44 = .154 if month == 39
replace pct_35_to_44 = .154 if month == 40
replace pct_35_to_44 = .154 if month == 41
replace pct_35_to_44 = .154 if month == 42
replace pct_35_to_44 = .154 if month == 43
replace pct_35_to_44 = .154 if month == 44
replace pct_35_to_44 = .154 if month == 45
replace pct_35_to_44 = .154 if month == 46
replace pct_35_to_44 = .154 if month == 47
replace pct_35_to_44 = .154 if month == 48
replace pct_35_to_44 = .151 if month == 49
replace pct_35_to_44 = .151 if month == 50
replace pct_35_to_44 = .151 if month == 51
replace pct_35_to_44 = .151 if month == 52
replace pct_35_to_44 = .151 if month == 53
replace pct_35_to_44 = .151 if month == 54
replace pct_35_to_44 = .151 if month == 55
replace pct_35_to_44 = .151 if month == 56
replace pct_35_to_44 = .151 if month == 57
replace pct_35_to_44 = .151 if month == 58
replace pct_35_to_44 = .151 if month == 59
replace pct_35_to_44 = .151 if month == 60
replace pct_35_to_44 = .149 if month == 61
replace pct_35_to_44 = .149 if month == 62
replace pct_35_to_44 = .149 if month == 63
replace pct_35_to_44 = .149 if month == 64
replace pct_35_to_44 = .149 if month == 65
replace pct_35_to_44 = .149 if month == 66
replace pct_35_to_44 = .149 if month == 67
replace pct_35_to_44 = .149 if month == 68
replace pct_35_to_44 = .149 if month == 69
replace pct_35_to_44 = .149 if month == 70
replace pct_35_to_44 = .149 if month == 71
replace pct_35_to_44 = .149 if month == 72
replace pct_35_to_44 = .147 if month == 73
replace pct_35_to_44 = .147 if month == 74
replace pct_35_to_44 = .147 if month == 75
replace pct_35_to_44 = .147 if month == 76
replace pct_35_to_44 = .147 if month == 77
replace pct_35_to_44 = .147 if month == 78
replace pct_35_to_44 = .147 if month == 79
replace pct_35_to_44 = .147 if month == 80
replace pct_35_to_44 = .147 if month == 81
replace pct_35_to_44 = .147 if month == 82
replace pct_35_to_44 = .147 if month == 83
replace pct_35_to_44 = .147 if month == 84

gen pct_45_to_54 = 0
replace pct_45_to_54 = .133 if month == 1
replace pct_45_to_54 = .133 if month == 2
replace pct_45_to_54 = .133 if month == 3
replace pct_45_to_54 = .133 if month == 4
replace pct_45_to_54 = .133 if month == 5
replace pct_45_to_54 = .133 if month == 6
replace pct_45_to_54 = .133 if month == 7
replace pct_45_to_54 = .133 if month == 8
replace pct_45_to_54 = .133 if month == 9
replace pct_45_to_54 = .133 if month == 10
replace pct_45_to_54 = .133 if month == 11
replace pct_45_to_54 = .133 if month == 12
replace pct_45_to_54 = .138 if month == 13
replace pct_45_to_54 = .138 if month == 14
replace pct_45_to_54 = .138 if month == 15
replace pct_45_to_54 = .138 if month == 16
replace pct_45_to_54 = .138 if month == 17
replace pct_45_to_54 = .138 if month == 18
replace pct_45_to_54 = .138 if month == 19
replace pct_45_to_54 = .138 if month == 20
replace pct_45_to_54 = .138 if month == 21
replace pct_45_to_54 = .138 if month == 22
replace pct_45_to_54 = .138 if month == 23
replace pct_45_to_54 = .138 if month == 24
replace pct_45_to_54 = .139 if month == 25
replace pct_45_to_54 = .139 if month == 26
replace pct_45_to_54 = .139 if month == 27
replace pct_45_to_54 = .139 if month == 28
replace pct_45_to_54 = .139 if month == 29
replace pct_45_to_54 = .139 if month == 30
replace pct_45_to_54 = .139 if month == 31
replace pct_45_to_54 = .139 if month == 32
replace pct_45_to_54 = .139 if month == 33
replace pct_45_to_54 = .139 if month == 34
replace pct_45_to_54 = .139 if month == 35
replace pct_45_to_54 = .139 if month == 36
replace pct_45_to_54 = .141 if month == 37
replace pct_45_to_54 = .141 if month == 38
replace pct_45_to_54 = .141 if month == 39
replace pct_45_to_54 = .141 if month == 40
replace pct_45_to_54 = .141 if month == 41
replace pct_45_to_54 = .141 if month == 42
replace pct_45_to_54 = .141 if month == 43
replace pct_45_to_54 = .141 if month == 44
replace pct_45_to_54 = .141 if month == 45
replace pct_45_to_54 = .141 if month == 46
replace pct_45_to_54 = .141 if month == 47
replace pct_45_to_54 = .141 if month == 48
replace pct_45_to_54 = .142 if month == 49
replace pct_45_to_54 = .142 if month == 50
replace pct_45_to_54 = .142 if month == 51
replace pct_45_to_54 = .142 if month == 52
replace pct_45_to_54 = .142 if month == 53
replace pct_45_to_54 = .142 if month == 54
replace pct_45_to_54 = .142 if month == 55
replace pct_45_to_54 = .142 if month == 56
replace pct_45_to_54 = .142 if month == 57
replace pct_45_to_54 = .142 if month == 58
replace pct_45_to_54 = .142 if month == 59
replace pct_45_to_54 = .142 if month == 60
replace pct_45_to_54 = .144 if month == 61
replace pct_45_to_54 = .144 if month == 62
replace pct_45_to_54 = .144 if month == 63
replace pct_45_to_54 = .144 if month == 64
replace pct_45_to_54 = .144 if month == 65
replace pct_45_to_54 = .144 if month == 66
replace pct_45_to_54 = .144 if month == 67
replace pct_45_to_54 = .144 if month == 68
replace pct_45_to_54 = .144 if month == 69
replace pct_45_to_54 = .144 if month == 70
replace pct_45_to_54 = .144 if month == 71
replace pct_45_to_54 = .144 if month == 72
replace pct_45_to_54 = .146 if month == 73
replace pct_45_to_54 = .146 if month == 74
replace pct_45_to_54 = .146 if month == 75
replace pct_45_to_54 = .146 if month == 76
replace pct_45_to_54 = .146 if month == 77
replace pct_45_to_54 = .146 if month == 78
replace pct_45_to_54 = .146 if month == 79
replace pct_45_to_54 = .146 if month == 80
replace pct_45_to_54 = .146 if month == 81
replace pct_45_to_54 = .146 if month == 82
replace pct_45_to_54 = .146 if month == 83
replace pct_45_to_54 = .146 if month == 84

gen ln_19 = log(pct_15_to_19)
gen ln_24 = log(pct_20_to_24)
gen ln_29 = log(pct_25_to_29)
gen ln_34 = log(pct_30_to_34)
gen ln_44 = log(pct_35_to_44)
gen ln_54 = log(pct_45_to_54)

reg ln_viol ln_evm ln_black ln_white ln_19 ln_24 ln_29 ln_34 jan feb mar apr jun jul aug sep oct nov dc

twoway (scatter viol evm)

gen stl_black = 0
gen stl_white = 0



replace stl_black = .511 if month == 1
replace stl_black = .511 if month == 2
replace stl_black = .511 if month == 3
replace stl_black = .511 if month == 4
replace stl_black = .511 if month == 5
replace stl_black = .511 if month == 6
replace stl_black = .511 if month == 7
replace stl_black = .511 if month == 8
replace stl_black = .511 if month == 9
replace stl_black = .511 if month == 10
replace stl_black = .511 if month == 11
replace stl_black = .511 if month == 12
replace stl_black = .511 if month == 13
replace stl_black = .511 if month == 14
replace stl_black = .511 if month == 15
replace stl_black = .511 if month == 16
replace stl_black = .511 if month == 17
replace stl_black = .511 if month == 18
replace stl_black = .511 if month == 19
replace stl_black = .511 if month == 20
replace stl_black = .511 if month == 21
replace stl_black = .511 if month == 22
replace stl_black = .511 if month == 23
replace stl_black = .511 if month == 24
replace stl_black = .511 if month == 25
replace stl_black = .511 if month == 26
replace stl_black = .511 if month == 27
replace stl_black = .511 if month == 28
replace stl_black = .511 if month == 29
replace stl_black = .511 if month == 30
replace stl_black = .511 if month == 31
replace stl_black = .511 if month == 32
replace stl_black = .511 if month == 33
replace stl_black = .511 if month == 34
replace stl_black = .511 if month == 35
replace stl_black = .511 if month == 36
replace stl_black = .511 if month == 37
replace stl_black = .511 if month == 38
replace stl_black = .511 if month == 39
replace stl_black = .511 if month == 40
replace stl_black = .511 if month == 41
replace stl_black = .511 if month == 42
replace stl_black = .511 if month == 43
replace stl_black = .511 if month == 44
replace stl_black = .511 if month == 45
replace stl_black = .511 if month == 46
replace stl_black = .511 if month == 47
replace stl_black = .511 if month == 48
replace stl_black = .511 if month == 49
replace stl_black = .511 if month == 50
replace stl_black = .511 if month == 51
replace stl_black = .511 if month == 52
replace stl_black = .511 if month == 53
replace stl_black = .511 if month == 54
replace stl_black = .511 if month == 55
replace stl_black = .511 if month == 56
replace stl_black = .511 if month == 57
replace stl_black = .511 if month == 58
replace stl_black = .511 if month == 59
replace stl_black = .511 if month == 60
replace stl_black = .511 if month == 61
replace stl_black = .511 if month == 62
replace stl_black = .511 if month == 63
replace stl_black = .511 if month == 64
replace stl_black = .511 if month == 65
replace stl_black = .511 if month == 66
replace stl_black = .511 if month == 67
replace stl_black = .511 if month == 68
replace stl_black = .511 if month == 69
replace stl_black = .511 if month == 70
replace stl_black = .511 if month == 71
replace stl_black = .511 if month == 72
replace stl_black = .511 if month == 73
replace stl_black = .511 if month == 74
replace stl_black = .511 if month == 75
replace stl_black = .511 if month == 76
replace stl_black = .511 if month == 77
replace stl_black = .511 if month == 78
replace stl_black = .511 if month == 79
replace stl_black = .511 if month == 80
replace stl_black = .511 if month == 81
replace stl_black = .511 if month == 82
replace stl_black = .511 if month == 83
replace stl_black = .511 if month == 84

replace stl_white = .438 if month == 1
replace stl_white = .438 if month == 2
replace stl_white = .438 if month == 3
replace stl_white = .438 if month == 4
replace stl_white = .438 if month == 5
replace stl_white = .438 if month == 6
replace stl_white = .438 if month == 7
replace stl_white = .438 if month == 8
replace stl_white = .438 if month == 9
replace stl_white = .438 if month == 10
replace stl_white = .438 if month == 11
replace stl_white = .438 if month == 12
replace stl_white = .438 if month == 13
replace stl_white = .438 if month ==14
replace stl_white = .438 if month ==15
replace stl_white = .438 if month ==16
replace stl_white = .438 if month ==17
replace stl_white = .438 if month ==18
replace stl_white = .438 if month ==19
replace stl_white = .438 if month ==20
replace stl_white = .438 if month ==21
replace stl_white = .438 if month ==22
replace stl_white = .438 if month ==23
replace stl_white = .438 if month ==24
replace stl_white = .438 if month ==25
replace stl_white = .438 if month ==26
replace stl_white = .438 if month ==27
replace stl_white = .438 if month ==28
replace stl_white = .438 if month ==29
replace stl_white = .438 if month ==30
replace stl_white = .438 if month ==31
replace stl_white = .438 if month ==32
replace stl_white = .438 if month ==33
replace stl_white = .438 if month ==34
replace stl_white = .438 if month ==35
replace stl_white = .438 if month ==36
replace stl_white = .438 if month ==37
replace stl_white = .438 if month ==38
replace stl_white = .438 if month ==39
replace stl_white = .438 if month ==40
replace stl_white = .438 if month ==41
replace stl_white = .438 if month ==42
replace stl_white = .438 if month ==43
replace stl_white = .438 if month ==44
replace stl_white = .438 if month ==45
replace stl_white = .438 if month ==46
replace stl_white = .438 if month ==47
replace stl_white = .438 if month ==48
replace stl_white = .438 if month ==49
replace stl_white = .438 if month ==50
replace stl_white = .438 if month ==51
replace stl_white = .438 if month ==52
replace stl_white = .438 if month ==53
replace stl_white = .438 if month ==54
replace stl_white = .438 if month ==55
replace stl_white = .438 if month ==56
replace stl_white = .438 if month ==57
replace stl_white = .438 if month ==58
replace stl_white = .438 if month ==59
replace stl_white = .438 if month ==60
replace stl_white = .438 if month ==61
replace stl_white = .438 if month ==62
replace stl_white = .438 if month ==63
replace stl_white = .438 if month ==64
replace stl_white = .438 if month ==65
replace stl_white = .438 if month ==66
replace stl_white = .438 if month ==67
replace stl_white = .438 if month ==68
replace stl_white = .438 if month ==69
replace stl_white = .438 if month ==70
replace stl_white = .438 if month ==71
replace stl_white = .438 if month ==72
replace stl_white = .438 if month ==73
replace stl_white = .438 if month ==74
replace stl_white = .438 if month ==75
replace stl_white = .438 if month ==76
replace stl_white = .438 if month ==77
replace stl_white = .438 if month ==78
replace stl_white = .438 if month ==79
replace stl_white = .438 if month ==80
replace stl_white = .438 if month ==81
replace stl_white = .438 if month ==82
replace stl_white = .438 if month ==83
replace stl_white = .438 if month ==84


gen chi_black = 0
gen chi_white = 0


replace chi_black = .368 if month == 1
replace chi_black = .368 if month == 2
replace chi_black = .368 if month == 3
replace chi_black = .368 if month == 4
replace chi_black = .368 if month == 5
replace chi_black = .368 if month == 6
replace chi_black = .368 if month == 7
replace chi_black = .368 if month == 8
replace chi_black = .368 if month == 9
replace chi_black = .368 if month == 10
replace chi_black = .368 if month == 11
replace chi_black = .368 if month == 12
replace chi_black = .368 if month == 13
replace chi_black = .368 if month == 14
replace chi_black = .368 if month == 15
replace chi_black = .368 if month == 16
replace chi_black = .368 if month == 17
replace chi_black = .368 if month == 18
replace chi_black = .368 if month == 19
replace chi_black = .368 if month == 20
replace chi_black = .368 if month == 21
replace chi_black = .368 if month == 22
replace chi_black = .368 if month == 23
replace chi_black = .368 if month == 24
replace chi_black = .368 if month == 25
replace chi_black = .368 if month == 26
replace chi_black = .368 if month == 27
replace chi_black = .368 if month == 28
replace chi_black = .368 if month == 29
replace chi_black = .368 if month == 30
replace chi_black = .368 if month == 31
replace chi_black = .368 if month == 32
replace chi_black = .368 if month == 33
replace chi_black = .368 if month == 34
replace chi_black = .368 if month == 35
replace chi_black = .368 if month == 36
replace chi_black = .368 if month == 37
replace chi_black = .368 if month == 38
replace chi_black = .368 if month == 39
replace chi_black = .368 if month == 40
replace chi_black = .368 if month == 41
replace chi_black = .368 if month == 42
replace chi_black = .368 if month == 43
replace chi_black = .368 if month == 44
replace chi_black = .368 if month == 45
replace chi_black = .368 if month == 46
replace chi_black = .368 if month == 47
replace chi_black = .368 if month == 48
replace chi_black = .368 if month == 49
replace chi_black = .368 if month == 50
replace chi_black = .368 if month == 51
replace chi_black = .368 if month == 52
replace chi_black = .368 if month == 53
replace chi_black = .368 if month == 54
replace chi_black = .368 if month == 55
replace chi_black = .368 if month == 56
replace chi_black = .368 if month == 57
replace chi_black = .368 if month == 58
replace chi_black = .368 if month == 59
replace chi_black = .368 if month == 60
replace chi_black = .368 if month == 61
replace chi_black = .368 if month == 62
replace chi_black = .368 if month == 63
replace chi_black = .368 if month == 64
replace chi_black = .368 if month == 65
replace chi_black = .368 if month == 66
replace chi_black = .368 if month == 67
replace chi_black = .368 if month == 68
replace chi_black = .368 if month == 69
replace chi_black = .368 if month == 70
replace chi_black = .368 if month == 71
replace chi_black = .368 if month == 72
replace chi_black = .368 if month == 73
replace chi_black = .368 if month == 74
replace chi_black = .368 if month == 75
replace chi_black = .368 if month == 76
replace chi_black = .368 if month == 77
replace chi_black = .368 if month == 78
replace chi_black = .368 if month == 79
replace chi_black = .368 if month == 80
replace chi_black = .368 if month == 81
replace chi_black = .368 if month == 82
replace chi_black = .368 if month == 83
replace chi_black = .368 if month == 84

replace chi_white = .42 if month == 1
replace chi_white = .42 if month == 2
replace chi_white = .42 if month == 3
replace chi_white = .42 if month == 4
replace chi_white = .42 if month == 5
replace chi_white = .42 if month == 6
replace chi_white = .42 if month == 7
replace chi_white = .42 if month == 8
replace chi_white = .42 if month == 9
replace chi_white = .42 if month == 10
replace chi_white = .42 if month == 11
replace chi_white = .42 if month == 12
replace chi_white = .42 if month == 13
replace chi_white = .42 if month == 14
replace chi_white = .42 if month == 15
replace chi_white = .42 if month == 16
replace chi_white = .42 if month == 17
replace chi_white = .42 if month == 18
replace chi_white = .42 if month == 19
replace chi_white = .42 if month == 20
replace chi_white = .42 if month == 21
replace chi_white = .42 if month == 22
replace chi_white = .42 if month == 23
replace chi_white = .42 if month == 24
replace chi_white = .42 if month == 25
replace chi_white = .42 if month == 26
replace chi_white = .42 if month == 27
replace chi_white = .42 if month == 28
replace chi_white = .42 if month == 29
replace chi_white = .42 if month == 30
replace chi_white = .42 if month == 31
replace chi_white = .42 if month == 32
replace chi_white = .42 if month == 33
replace chi_white = .42 if month == 34
replace chi_white = .42 if month == 35
replace chi_white = .42 if month == 36
replace chi_white = .42 if month == 37
replace chi_white = .42 if month == 38
replace chi_white = .42 if month == 39
replace chi_white = .42 if month == 40
replace chi_white = .42 if month == 41
replace chi_white = .42 if month == 42
replace chi_white = .42 if month == 43
replace chi_white = .42 if month == 44
replace chi_white = .42 if month == 45
replace chi_white = .42 if month == 46
replace chi_white = .42 if month == 47
replace chi_white = .42 if month == 48
replace chi_white = .42 if month == 49
replace chi_white = .42 if month == 50
replace chi_white = .42 if month == 51
replace chi_white = .42 if month == 52
replace chi_white = .42 if month == 53
replace chi_white = .42 if month == 54
replace chi_white = .42 if month == 55
replace chi_white = .42 if month == 56
replace chi_white = .42 if month == 57
replace chi_white = .42 if month == 58
replace chi_white = .42 if month == 59
replace chi_white = .42 if month == 60
replace chi_white = .42 if month == 61
replace chi_white = .42 if month == 62
replace chi_white = .42 if month == 63
replace chi_white = .42 if month == 64
replace chi_white = .42 if month == 65
replace chi_white = .42 if month == 66
replace chi_white = .42 if month == 67
replace chi_white = .42 if month == 68
replace chi_white = .42 if month == 69
replace chi_white = .42 if month == 70
replace chi_white = .42 if month == 71
replace chi_white = .42 if month == 72
replace chi_white = .42 if month == 73
replace chi_white = .42 if month == 74
replace chi_white = .42 if month == 75
replace chi_white = .42 if month == 76
replace chi_white = .42 if month == 77
replace chi_white = .42 if month == 78
replace chi_white = .42 if month == 79
replace chi_white = .42 if month == 80
replace chi_white = .42 if month == 81
replace chi_white = .42 if month == 82
replace chi_white = .42 if month == 83
replace chi_white = .42 if month == 84

gen stl_viol = 0
gen chi_viol = 0

replace stl_viol = .023 if month == 1
replace stl_viol = .023 if month == 2
replace stl_viol = .023 if month == 3
replace stl_viol = .023 if month == 4
replace stl_viol = .023 if month == 5
replace stl_viol = .023 if month == 6
replace stl_viol = .023 if month == 7
replace stl_viol = .023 if month == 8
replace stl_viol = .023 if month == 9
replace stl_viol = .023 if month == 10
replace stl_viol = .023 if month == 11
replace stl_viol = .023 if month == 12
replace stl_viol = .021 if month == 13
replace stl_viol = .021 if month == 14
replace stl_viol = .021 if month == 15
replace stl_viol = .021 if month == 16
replace stl_viol = .021 if month == 17
replace stl_viol = .021 if month == 18
replace stl_viol = .021 if month == 19
replace stl_viol = .021 if month == 20
replace stl_viol = .021 if month == 21
replace stl_viol = .021 if month == 22
replace stl_viol = .021 if month == 23
replace stl_viol = .021 if month == 24
replace stl_viol = .021 if month == 25
replace stl_viol = .021 if month == 26
replace stl_viol = .021 if month == 27
replace stl_viol = .021 if month == 28
replace stl_viol = .021 if month == 29
replace stl_viol = .021 if month == 30
replace stl_viol = .021 if month == 31
replace stl_viol = .021 if month == 32
replace stl_viol = .021 if month == 33
replace stl_viol = .021 if month == 34
replace stl_viol = .021 if month == 35
replace stl_viol = .021 if month == 36
replace stl_viol = .018 if month == 37
replace stl_viol = .018 if month == 38
replace stl_viol = .018 if month == 39
replace stl_viol = .018 if month == 40
replace stl_viol = .018 if month == 41
replace stl_viol = .018 if month == 42
replace stl_viol = .018 if month == 43
replace stl_viol = .018 if month == 44
replace stl_viol = .018 if month == 45
replace stl_viol = .018 if month == 46
replace stl_viol = .018 if month == 47
replace stl_viol = .018 if month == 48
replace stl_viol = .02 if month == 49
replace stl_viol = .02 if month == 50
replace stl_viol = .02 if month == 51
replace stl_viol = .02 if month == 52
replace stl_viol = .02 if month == 53
replace stl_viol = .02 if month == 54
replace stl_viol = .02 if month == 55
replace stl_viol = .02 if month == 56
replace stl_viol = .02 if month == 57
replace stl_viol = .02 if month == 58
replace stl_viol = .02 if month == 59
replace stl_viol = .02 if month == 60
replace stl_viol = .023 if month == 61
replace stl_viol = .023 if month == 62
replace stl_viol = .023 if month == 63
replace stl_viol = .023 if month == 64
replace stl_viol = .023 if month == 65
replace stl_viol = .023 if month == 66
replace stl_viol = .023 if month == 67
replace stl_viol = .023 if month == 68
replace stl_viol = .023 if month == 69
replace stl_viol = .023 if month == 70
replace stl_viol = .023 if month == 71
replace stl_viol = .023 if month == 72
replace stl_viol = .024 if month == 73
replace stl_viol = .024 if month == 74
replace stl_viol = .024 if month == 75
replace stl_viol = .024 if month == 76
replace stl_viol = .024 if month == 77
replace stl_viol = .024 if month == 78
replace stl_viol = .024 if month == 79
replace stl_viol = .024 if month == 80
replace stl_viol = .024 if month == 81
replace stl_viol = .024 if month == 82
replace stl_viol = .024 if month == 83
replace stl_viol = .024 if month == 84

replace chi_viol = .016 if month == 1
replace chi_viol = .016 if month == 2
replace chi_viol = .016 if month == 3
replace chi_viol = .016 if month == 4
replace chi_viol = .016 if month == 5
replace chi_viol = .016 if month == 6
replace chi_viol = .016 if month == 7
replace chi_viol = .016 if month == 8
replace chi_viol = .016 if month == 9
replace chi_viol = .016 if month == 10
replace chi_viol = .016 if month == 11
replace chi_viol = .016 if month == 12
replace chi_viol = .015 if month == 13
replace chi_viol = .015 if month == 14
replace chi_viol = .015 if month == 15
replace chi_viol = .015 if month == 16
replace chi_viol = .015 if month == 17
replace chi_viol = .015 if month == 18
replace chi_viol = .015 if month == 19
replace chi_viol = .015 if month == 20
replace chi_viol = .015 if month == 21
replace chi_viol = .015 if month == 22
replace chi_viol = .015 if month == 23
replace chi_viol = .015 if month == 24
replace chi_viol = .015 if month == 25
replace chi_viol = .015 if month == 26
replace chi_viol = .015 if month == 27
replace chi_viol = .015 if month == 28
replace chi_viol = .015 if month == 29
replace chi_viol = .015 if month == 30
replace chi_viol = .015 if month == 31
replace chi_viol = .015 if month == 32
replace chi_viol = .015 if month == 33
replace chi_viol = .015 if month == 34
replace chi_viol = .015 if month == 35
replace chi_viol = .015 if month == 36
replace chi_viol = .013 if month == 37
replace chi_viol = .013 if month == 38
replace chi_viol = .013 if month == 39
replace chi_viol = .013 if month == 40
replace chi_viol = .013 if month == 41
replace chi_viol = .013 if month == 42
replace chi_viol = .013 if month == 43
replace chi_viol = .013 if month == 44
replace chi_viol = .013 if month == 45
replace chi_viol = .013 if month == 46
replace chi_viol = .013 if month == 47
replace chi_viol = .013 if month == 48
replace chi_viol = .012 if month == 49
replace chi_viol = .012 if month == 50
replace chi_viol = .012 if month == 51
replace chi_viol = .012 if month == 52
replace chi_viol = .012 if month == 53
replace chi_viol = .012 if month == 54
replace chi_viol = .012 if month == 55
replace chi_viol = .012 if month == 56
replace chi_viol = .012 if month == 57
replace chi_viol = .012 if month == 58
replace chi_viol = .012 if month == 59
replace chi_viol = .012 if month == 60
replace chi_viol = .012 if month == 61
replace chi_viol = .012 if month == 62
replace chi_viol = .012 if month == 63
replace chi_viol = .012 if month == 64
replace chi_viol = .012 if month == 65
replace chi_viol = .012 if month == 66
replace chi_viol = .012 if month == 67
replace chi_viol = .012 if month == 68
replace chi_viol = .012 if month == 69
replace chi_viol = .012 if month == 70
replace chi_viol = .012 if month == 71
replace chi_viol = .012 if month == 72
replace chi_viol = .012 if month == 73
replace chi_viol = .012 if month == 74
replace chi_viol = .012 if month == 75
replace chi_viol = .012 if month == 76
replace chi_viol = .012 if month == 77
replace chi_viol = .012 if month == 78
replace chi_viol = .012 if month == 79
replace chi_viol = .012 if month == 80
replace chi_viol = .012 if month == 81
replace chi_viol = .012 if month == 82
replace chi_viol = .012 if month == 83
replace chi_viol = .012 if month == 84

gen ln_stl = log(stl_viol)
gen ln_chi = log(chi_viol)
gen ln_stlb = log(stl_black)
gen ln_stlw = log(stl_white)
gen ln_chib = log(chi_black)
gen ln_chiw = log(chi_white)


reg ln_stl ln_evm ln_stlb ln_stlw

reg ln_chi ln_evm ln_chib ln_chiw

gen prev_viol = .

replace prev_viol = 114455.44 if month == 1

replace prev_viol = 109670.253 if month == 2

replace prev_viol = 105397.386 if month == 3

replace prev_viol = 119640.276 if month == 4

replace prev_viol = 118215.987 if month == 5

replace prev_viol = 131034.588 if month == 6

replace prev_viol = 122488.854 if month == 7

replace prev_viol = 128186.01 if month == 8

replace prev_viol = 126761.721 if month == 9

replace prev_viol = 122488.854 if month == 10 

replace prev_viol = 123913.143 if month == 11

replace prev_viol = 108245.964 if month == 12

replace prev_viol = 109670.253 if month == 13

replace prev_viol = 109182.436 if month == 14

replace prev_viol = 100562.77 if month == 15

replace prev_viol = 119238.713 if month == 16

replace prev_viol = 122111.935 if month == 17

replace prev_viol = 129294.99 if month == 18

replace prev_viol = 123548.546 if month == 19

replace prev_viol = 129294.99 if month == 20

replace prev_viol = 124985.157 if month == 21

replace prev_viol = 126421.768 if month == 22

replace prev_viol = 127858.379 if month == 23

replace prev_viol = 113492.269 if month == 24

replace prev_viol = 113492.269 if month == 25

replace prev_viol = 112679.675 if month == 26

replace prev_viol = 95563.775 if month == 27

replace prev_viol = 112679.675 if month == 28

replace prev_viol = 115532.325 if month == 29

replace prev_viol = 124090.275 if month == 30

replace prev_viol = 125516.6 if month == 31

replace prev_viol = 132648.225 if month == 32

replace prev_viol = 132648.225 if month == 33

replace prev_viol = 131221.9 if month == 34

replace prev_viol = 122663.95 if month == 35

replace prev_viol = 109827.025 if month == 36

replace prev_viol = 109827.025 if month == 37

replace prev_viol = 107738.202 if month == 38

replace prev_viol = 89781.835 if month == 39

replace prev_viol = 113263.238 if month == 40

replace prev_viol = 114644.497 if month == 41

replace prev_viol = 122932.051 if month == 42

replace prev_viol = 121550.792 if month == 43

replace prev_viol = 127075.828 if month == 44

replace prev_viol = 127075.828 if month == 45

replace prev_viol = 118788.274 if month == 46

replace prev_viol = 121550.792 if month == 47

replace prev_viol = 109119.461 if month == 48

replace prev_viol = 106356.943 if month == 49

replace prev_viol = 106626.702 if month == 50

replace prev_viol = 95690.63 if month == 51

replace prev_viol = 113461.747 if month == 52

replace prev_viol = 112094.738 if month == 53

replace prev_viol = 123030.81 if month == 54

replace prev_viol = 117562.774 if month == 55

replace prev_viol = 125764.828 if month == 56

replace prev_viol = 123030.81 if month == 57

replace prev_viol = 116195.765 if month == 58

replace prev_viol = 117562.774 if month == 59

replace prev_viol = 106626.702 if month == 60

replace prev_viol = 107993.711 if month == 61

replace prev_viol = 109864.905 if month == 62

replace prev_viol = 98739.345 if month == 63

replace prev_viol = 112646.295 if month == 64

replace prev_viol = 112646.295 if month == 65

replace prev_viol = 122381.16 if month == 66

replace prev_viol = 119599.77 if month == 67

replace prev_viol = 126553.245 if month == 68

replace prev_viol = 126553.245 if month == 69

replace prev_viol = 119599.77 if month == 70

replace prev_viol = 120990.465 if month == 71

replace prev_viol = 108474.21 if month == 72

replace prev_viol = 109864.905 if month == 73

replace prev_viol = 112001.855 if month == 74

replace prev_viol = 100659.895 if month == 75

replace prev_viol = 114837.345 if month == 76

replace prev_viol = 114837.345 if month == 77

replace prev_viol = 124761.56 if month == 78

replace prev_viol = 121926.07 if month == 79

replace prev_viol = 129014.795 if month == 80

replace prev_viol = 129014.795 if month == 81

replace prev_viol = 121926.07 if month == 82

replace prev_viol = 123343.815 if month == 83

replace prev_viol = 110584.11 if month == 84

gen ln_prev = log(prev_viol)

gen mwords = 0

replace mwords = 4 if month == 1
replace mwords = 4 if month == 2
replace mwords = 4 if month == 3
replace mwords = 1 if month == 5
replace mwords = 9 if month == 10
replace mwords = 3 if month == 11
replace mwords = 5 if month == 12
replace mwords = 5 if month == 13
replace mwords = 5 if month == 14
replace mwords = 4 if month == 15
replace mwords = 1 if month == 16
replace mwords = 1 if month == 17
replace mwords = 1 if month == 18
replace mwords = 6 if month == 20
replace mwords = 2 if month == 21
replace mwords = 3 if month == 22
replace mwords = 2 if month == 23
replace mwords = 1 if month == 24
replace mwords = 4 if month == 25
replace mwords = 6 if month == 26
replace mwords = 7 if month == 27
replace mwords = 3 if month == 28
replace mwords = 4 if month == 29
replace mwords = 6 if month == 30
replace mwords = 3 if month == 31
replace mwords = 14 if month == 32
replace mwords = 31 if month == 33
replace mwords = 26 if month == 34
replace mwords = 19 if month == 35
replace mwords = 7 if month == 36
replace mwords = 9 if month == 37
replace mwords = 9 if month == 38
replace mwords = 12 if month == 39
replace mwords = 21 if month == 40
replace mwords = 16 if month == 41
replace mwords = 9 if month == 42
replace mwords = 5 if month == 43
replace mwords = 6 if month == 44
replace mwords = 7 if month == 45
replace mwords = 14 if month == 46
replace mwords = 12 if month == 47
replace mwords = 17 if month == 48
replace mwords = 19 if month == 49
replace mwords = 10 if month == 50
replace mwords = 14 if month == 51
replace mwords = 8 if month == 52
replace mwords = 10 if month == 53
replace mwords = 10 if month == 54
replace mwords = 8 if month == 55
replace mwords = 11 if month == 56
replace mwords = 13 if month == 57
replace mwords = 9 if month == 58
replace mwords = 28 if month == 59
replace mwords = 31 if month == 60
replace mwords = 25 if month == 61
replace mwords = 21 if month == 62
replace mwords = 21 if month == 63
replace mwords = 13 if month == 64
replace mwords = 10 if month == 65
replace mwords = 11 if month == 66
replace mwords = 6 if month == 67
replace mwords = 19 if month == 68
replace mwords = 13 if month == 69
replace mwords = 4 if month == 70
replace mwords = 5 if month == 71
replace mwords = 9 if month == 72
replace mwords = 10 if month == 73
replace mwords = 2 if month == 74
replace mwords = 6 if month == 75
replace mwords = 6 if month == 76
replace mwords = 14 if month == 77
replace mwords = 9 if month == 78
replace mwords = 7 if month == 79
replace mwords = 21 if month == 80
replace mwords = 14 if month == 81
replace mwords = 2 if month == 82
replace mwords = 8 if month == 83
replace mwords = 8 if month == 84

reg viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg prev_viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

gen year = 1
replace year = 2 if month == 13
replace year = 2 if month == 14
replace year = 2 if month == 15
replace year = 2 if month == 16
replace year = 2 if month == 17
replace year = 2 if month == 18
replace year = 2 if month == 19
replace year = 2 if month == 20
replace year = 2 if month == 21
replace year = 2 if month == 22
replace year = 2 if month == 23
replace year = 2 if month == 24
replace year = 3 if month == 25
replace year = 3 if month == 26
replace year = 3 if month == 27
replace year = 3 if month == 28
replace year = 3 if month == 29
replace year = 3 if month == 30
replace year = 3 if month == 31
replace year = 3 if month == 32
replace year = 3 if month == 33
replace year = 3 if month == 34
replace year = 3 if month == 35
replace year = 3 if month == 36
replace year = 4 if month == 37
replace year = 4 if month == 38
replace year = 4 if month == 39
replace year = 4 if month == 40
replace year = 4 if month == 41
replace year = 4 if month == 42
replace year = 4 if month == 43
replace year = 4 if month == 44
replace year = 4 if month == 45
replace year = 4 if month == 46
replace year = 4 if month == 47
replace year = 4 if month == 48
replace year = 5 if month == 49
replace year = 5 if month == 50
replace year = 5 if month == 51
replace year = 5 if month == 52
replace year = 5 if month == 53
replace year = 5 if month == 54
replace year = 5 if month == 55
replace year = 5 if month == 56
replace year = 5 if month == 57
replace year = 5 if month == 58
replace year = 5 if month == 59
replace year = 5 if month == 60
replace year = 6 if month == 61
replace year = 6 if month == 62
replace year = 6 if month == 63
replace year = 6 if month == 64
replace year = 6 if month == 65
replace year = 6 if month == 66
replace year = 6 if month == 67
replace year = 6 if month == 68
replace year = 6 if month == 69
replace year = 6 if month == 70
replace year = 6 if month == 71
replace year = 6 if month == 72
replace year = 7 if month == 73
replace year = 7 if month == 74
replace year = 7 if month == 75
replace year = 7 if month == 76
replace year = 7 if month == 77
replace year = 7 if month == 78
replace year = 7 if month == 79
replace year = 7 if month == 80
replace year = 7 if month == 81
replace year = 7 if month == 82
replace year = 7 if month == 83
replace year = 7 if month == 84

reg viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

predict pred_viol

twoway (line pred_viol month) (line viol month)

reg prev_viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg ln_viol ln_evm ln_black ln_white jan feb mar apr jun jul aug sep oct nov dc year ln_19 ln_24 ln_29 ln_34

reg ln_prev ln_evm ln_black ln_white jan feb mar apr jun jul aug sep oct nov dc year ln_19 ln_24 ln_29 ln_34
