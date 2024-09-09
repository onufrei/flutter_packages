// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

/// The direction the camera is facing.
enum CameraLensDirection {
  /// Front facing camera (a user looking at the screen is seen by the camera).
  front,

  /// Back facing camera (a user looking at the screen is not seen by the camera).
  back,

  /// External camera which may not be mounted to the device.
  external,
}

/// Zoom of the camera
enum CameraZoomType {
  /// Default camera type
  wide,
  /// Zoomed camera (2x, 3x, 5x)
  telephoto,
  /// UltraWide camera (0.5x)
  ultrawide,
}

/// Properties of a camera device.
@immutable
class CameraDescription {
  /// Creates a new camera description with the given properties.
  const CameraDescription({
    required this.name,
    required this.zoomType,
    required this.zoomValue,
    required this.lensDirection,
    required this.sensorOrientation,
  });

  /// The name of the camera device.
  final String name;

  /// Zoom of the camera
  final CameraZoomType zoomType;

  final double zoomValue;

  /// The direction the camera is facing.
  final CameraLensDirection lensDirection;

  /// Clockwise angle through which the output image needs to be rotated to be upright on the device screen in its native orientation.
  ///
  /// **Range of valid values:**
  /// 0, 90, 180, 270
  ///
  /// On Android, also defines the direction of rolling shutter readout, which
  /// is from top to bottom in the sensor's coordinate system.
  final int sensorOrientation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CameraDescription &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              zoomType == other.zoomType &&
              zoomValue == other.zoomValue &&
              lensDirection == other.lensDirection;

  @override
  int get hashCode => Object.hash(name, lensDirection, zoomType, zoomValue);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'CameraDescription')}('
        '$name, $zoomType, $zoomValue, $lensDirection, $sensorOrientation)';
  }
}
