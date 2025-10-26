lazy val example = (project in file("example"))
  .settings(
    scalaVersion := "3.7.3",
    libraryDependencies += "com.lihaoyi" %% "cask" % "0.11.3",
    fork := true
  )