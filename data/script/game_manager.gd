extends Node

var gameLocale = "en"
var currentStage = 0
var currentStageUiTxtNode = null
var currentStagePopUpTxtNode = null

var coinsCollected = 0
var coinsCollectedInPrevStages = 0

var jumpsAllowed = 1

var canMove = false
var isJumpEnabled = false
var isDoubleJumpEnabled = false
var isFloatEnabled = false
