cmake_minimum_required(VERSION 3.20)

add_subdirectory(common)

add_subdirectory(AccumulativeRingMod)
add_subdirectory(BasicLimiter)
add_subdirectory(BasicLimiterAutoMake)
add_subdirectory(ClangCymbal)
add_subdirectory(ClangSynth)
add_subdirectory(CollidingCombSynth)
add_subdirectory(CombDistortion)
add_subdirectory(CubicPadSynth)
add_subdirectory(EnvelopedSine)
add_subdirectory(EsPhaser)
add_subdirectory(FDN64Reverb)
add_subdirectory(FDNCymbal)
add_subdirectory(FeedbackPhaser)
add_subdirectory(FoldShaper)
add_subdirectory(IterativeSinCluster)
add_subdirectory(L3Reverb)
add_subdirectory(L4Reverb)
add_subdirectory(LatticeReverb)
add_subdirectory(LightPadSynth)
add_subdirectory(LongPhaser)
add_subdirectory(MatrixShifter)
add_subdirectory(MaybeSnare)
add_subdirectory(MembraneSynth)
add_subdirectory(MiniCliffEQ)
add_subdirectory(ModuloShaper)
add_subdirectory(NarrowingDelay)
add_subdirectory(OddPowShaper)
add_subdirectory(OrdinaryPhaser)
add_subdirectory(ParallelComb)
add_subdirectory(ParallelDetune)
add_subdirectory(PitchShiftDelay)
add_subdirectory(RingModSpacer)
add_subdirectory(SevenDelay)
add_subdirectory(SoftClipper)
add_subdirectory(SyncSawSynth)
add_subdirectory(TrapezoidSynth)
add_subdirectory(UltraSynth)
add_subdirectory(UltrasonicRingMod)
add_subdirectory(WaveCymbal)

## TestBedSynth is a prototype. Breaking changes will be introduced.
# add_subdirectory(TestBedSynth)
