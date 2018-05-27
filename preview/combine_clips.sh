#!/bin/bash
melt clips/* -consumer avformat:preview.mp4 acodec=libmp3lame vcodec=libx264
