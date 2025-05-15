Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1CAB97E3
	for <lists+drbd-dev@lfdr.de>; Fri, 16 May 2025 10:41:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5B9A16CD77;
	Fri, 16 May 2025 10:41:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92CC716B836
	for <drbd-dev@lists.linbit.com>; Thu, 15 May 2025 04:48:24 +0200 (CEST)
Received: by mail-wr1-f52.google.com with SMTP id
	ffacd0b85a97d-3a0b3f62d1aso61177f8f.1
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 19:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1747277303; x=1747882103; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=EJJaeQrQtjUX7GSzYSj03447z7DY4BNGaGnWhoSCIHc=;
	b=D4jH77jqebKLUEVaNdzJbrDdSu1uOMLnK0Dtwxx6HSwKO+pulRnCBJRpWG4DqALJAY
	Z5UMR2FXWQjlK9bnN2drvZ6IBCzaY1vrEu90PTI0Fmm2JHk33VmGX67PBwyXWTn6VDos
	4mGykSNxMrCpWJgN5Rqb7wMONWa0dQHDsGsEV/sxJBmB+0r5ydNYcNvi6BVYp8xUegeM
	0D0QenwH1J+ubeg0o5gvEFNR53c1LiZ1IA7LyvgYRKutlxXg9iKvjZbKUFjbv4/yNm/+
	abgsA0RDfH+QBWPK8Wm1xqT6UKg5E2d17+h5/N6il+Klu5vmRp7wG2tF0zLSF8cesXbO
	MnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1747277303; x=1747882103;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=EJJaeQrQtjUX7GSzYSj03447z7DY4BNGaGnWhoSCIHc=;
	b=MMUq0PUaEAm0InfHdCdw3LqtDs253St0IJK4E/OyO7mWhXehR9fV+lIZu3Lf8L0+b9
	2eBRjN9GUsbsTm7C0kWBkMCTGVRvf6kEHvPTChvJIm1EP7iyVLx7kqko9BZ2z9id68TS
	WGDkD5AZA0turu6y8pHbC1oh4ReH9x1yGKQsz/O69eFV8PNSDON9dHOFZJQqaD3F20gF
	/AFCN+43NIawATw2MnEIutTvPJAP8z0a3VQhPo4qFpkD78kX8XWTPyu0EQlSV3aZGsU5
	2h0Vp3nna78RkZnfIyKD7dUa5oeIGQF9HyIirzPfeOt+1xf39I1GdW7l8qz8kk9uV5QI
	Q3cg==
X-Gm-Message-State: AOJu0YzMDcqJSVjwe0yI+wV2YkoY9eCxWPgQwgQej9OLD8u9WsVzhx1l
	U3aVZaVk9Kfwhc18YsSZDj8AlC2as2SbbAu4hi2Gn9KzKISVEc4PUwZfhkxiDDCfMikFqxrGvIL
	C
X-Gm-Gg: ASbGnctX+fPzZFlDTaA/DapT3c48F8BmZoyKo5MRRU1DyNVDDidTZJO41QQFDiQC9EI
	xxMRG684476n8ooGjJFr/nfkw2T20ANSE/rL9vBkICMazG/j4CMrNelwUpXliw8bholToUeitiQ
	JxeyQXYMY8rVdyxffP6YxXDcFkiqs/45bJvLBXkvoYvfMEmta8WM2MYYKCJMk26wZFm4rTQr5XT
	LNudEsiH3f2r6h5VmsalOOnNE4bvJGqkj/dVj/2I07DLSoxz0dRvErZwsoEfW6mw6Y2IBtje/Xl
	pVAl+7OGFPzVQqXHNzd+BvYQF+aHCwF5vEOsmmaVHY4k0rOOzQKmnUSxt4tortU=
X-Google-Smtp-Source: AGHT+IHHzs8JZRGdYsqKW421loWs3sPUVFaa2PLEimUtRmGV4Xxfps9wEuyJAdaJ8h+9Pmc9ShuMBw==
X-Received: by 2002:a05:600c:474a:b0:439:9a40:aa27 with SMTP id
	5b1f17b1804b1-442f21789a7mr17547465e9.5.1747277302683; 
	Wed, 14 May 2025 19:48:22 -0700 (PDT)
Received: from p15.suse.cz ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7423772832csm10578197b3a.59.2025.05.14.19.48.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 May 2025 19:48:21 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [PATCH v2 0/2] fix drbd-utils minor issues
Date: Thu, 15 May 2025 10:48:13 +0800
Message-ID: <20250515024817.25717-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 May 2025 10:41:11 +0200
Cc: zzhou@suse.com
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This patchset fixes two issues:
- configure reports WARNING for SuSe-release file
- lock file permission issue in SELinux env

v1->v2
factor out shared code for creating lfname
add free lfname job after unlink()

Heming Zhao (2):
  build: changing SUSE release file
  remove lock file after using it

 configure.ac              |  4 ++--
 user/shared/drbdmeta.c    |  3 +++
 user/shared/shared_tool.c | 40 +++++++++++++++++++++++++++++----------
 user/shared/shared_tool.h |  2 +-
 user/v84/drbdsetup.c      |  2 +-
 user/v9/drbdsetup.c       |  2 +-
 6 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.43.0

