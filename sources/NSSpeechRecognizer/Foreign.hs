{-# LANGUAGE ForeignFunctionInterface, InterruptibleFFI #-}

{-|

-}
module NSSpeechRecognizer.Foreign where
import NSSpeechRecognizer.Types

import Foreign (Ptr,FunPtr)
import Foreign.C (CString)
-- import Foreign.C (CInt(..), CString)

--------------------------------------------------------------------------------

foreign import ccall safe "Recognizer.h test_NSSpeechRecognizer"
 c_NSSpeechRecognizer
  :: FunPtr RecognitionHandler
  -> CString
  -> IO ()

-- | @= [[NSRunLoop currentRunLoop] run];@. Doesn't return.
foreign import ccall interruptible "Recognizer.h beginCurrentRunLoop" beginCurrentRunLoop --NOTE TODO interruptible?
 :: IO ()

-- | @= [[NSRunLoop mainRunLoop] run];@. Doesn't return.
foreign import ccall interruptible "Recognizer.h beginMainRunLoop" beginMainRunLoop --NOTE interruptible?
 :: IO ()

{-old

Unacceptable result type in foreign declaration:
 ‘a’ is not a data type
When checking declaration:
 foreign import ccall safe "static Recognizer.h beginMainRunLoop" beginMainRunLoop
   :: IO a

-}

--------------------------------------------------------------------------------

foreign import ccall "wrapper"
  newRecognitionHandler :: RecognitionHandler -> IO (FunPtr RecognitionHandler)

foreign import ccall "dynamic"
  peekRecognitionHandler :: FunPtr RecognitionHandler -> RecognitionHandler

--------------------------------------------------------------------------------

{-

-- |
foreign import ccall "Recognizer.h xxx" xxx
 :: Ptr NSSpeechRecognizer -> () -> IO ()

-}

-- |
foreign import ccall "Recognizer.h new_NSSpeechRecognizer"   new_NSSpeechRecognizer
 :: IO (Ptr NSSpeechRecognizer)

-- |
foreign import ccall "Recognizer.h free_NSSpeechRecognizer"  free_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> IO ()

-- |
foreign import ccall "Recognizer.h start_NSSpeechRecognizer" start_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> IO ()

-- |
foreign import ccall "Recognizer.h stop_NSSpeechRecognizer"  stop_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> IO ()

-- |
foreign import ccall "Recognizer.h setExclusivity_NSSpeechRecognizer" setExclusivity_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> BOOL -> IO ()

-- |
foreign import ccall "Recognizer.h setForegroundOnly_NSSpeechRecognizer" setForegroundOnly_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> BOOL -> IO ()

-- |
foreign import ccall "Recognizer.h setCommands_NSSpeechRecognizer"    setCommands_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> CArray CString -> Int -> IO ()

-- |
foreign import ccall "Recognizer.h registerHandler_NSSpeechRecognizer" registerHandler_NSSpeechRecognizer
 :: Ptr NSSpeechRecognizer -> FunPtr RecognitionHandler -> IO ()

--------------------------------------------------------------------------------
