Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49332AEB37D
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Jun 2025 11:58:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A7500162252;
	Fri, 27 Jun 2025 11:57:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61CD51609AD
	for <drbd-dev@lists.linbit.com>; Fri, 27 Jun 2025 11:57:44 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id
	4fb4d7f45d1cf-60867565fb5so3265589a12.3
	for <drbd-dev@lists.linbit.com>; Fri, 27 Jun 2025 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1751018263;
	x=1751623063; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=mwDy+2proYOLrYP4jEl+UhyGumZmUzGwf/H1c+IwxdU=;
	b=umPRXCYnnVzbYfJcEzkyGEoF9E3VQEgu9f7Q0QDA0PmYhizugNJdA+G0LvZP5gsa3I
	7dMhJMsJCOaoYHnkDR+UdVKJcg0GgR7woGTrtYBZxQXdF6B7Tmxi6ivtpP0usJVYYWo7
	yUYOQs6qj8w+b18en7+quneBlFbW7t4rPOpx5stJ7LOK5NjMhTnVisun2Pp68VY1V4H1
	qBvdbJLRozmw5JHJwS01KBeIc087TokjtKTBxIxl0pqOM2BYPkeonAqF4ySTkfnGovCp
	ghzjtv+hzTwm8YQBqkxyChYAzlXiAPvN0eej3LVKn9C9B2Go4HJhPqPNpgSFqAOdUgnA
	yrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1751018263; x=1751623063;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=mwDy+2proYOLrYP4jEl+UhyGumZmUzGwf/H1c+IwxdU=;
	b=pWGFBkSG9dNC+UW4ZQskYK8xi3a0zbN20LN0LaDGh2rEAj48J72vhpVXguVdod0+8e
	fljC9Aowk66gHO9WJcJXqAuxDwby5Zf5ZtC3bf2Pyt58SzvFYxDIbqdx/lFphLrOa6jS
	kcKVBYKNekESx/uvBoL8pETIIKiF9hlqUiX2TdDk0B/OwOLEBQU544iDSI3hKk80DjVO
	1MKJdRj3rVeRb1iNk7zVWWj3vBlsqvPSFZ/A85cSp04YnCR/BeBJebX/HW0tMjWpeVQz
	LwNnjNhjuT/ZyD+Go509+zHw7MbMwOIICmqFWjoW2a/rZqlfUHCl4OlBpephBFEcYhyR
	XXdA==
X-Gm-Message-State: AOJu0YwVwIa3AKpW5iT8BsWR1/OgD4f7HLUsEY/q4CszgeGlDRmQFXH6
	R/FfOzFbW0OzDESL6isvyqU8jQpjxLpbePaDrwnL4lQ7QuhrGFEUoVtfxfZ0O4g2mQ4jKQ==
X-Gm-Gg: ASbGncuCBpT4bGItuHfXpi9CMauaD8tmGKOX24lOtnDR1O02Q9rvWOBWNH5S/dBopLn
	H3WNaviRP11DySAdmvN3byltuJahyryIYYfAA3KFBMrUwwXBtvJp9pS28Mw/3Twq8j1t9bPHqfs
	0bqxLdtAJkdFaIox+pfTnVT/z5apuiAg+Vq90p/bJicaj5VFeOT14GY4NVZrfDycKch2n6yXuLt
	N1OfAVxfiEKR8hnrmbLbIQwut7m6XNFiDJft9vyN/pQwCHjbhrUgddDa5r0jnfr8q1OyHF/qI/y
	kTNicl5/Z3EWOHndnS9hVIpsNHzGovoA1pNVNgFx7MQNmiMZBMhZ/Q7Podck/YGGng0ml9P2CAu
	ikG5VwkPAQRktPiVDehaIZWzYI3D7Knw6TMOL1rAtmIULAg==
X-Google-Smtp-Source: AGHT+IE1SvpNm5CP6mOqFBIwW5hSM+IQAnFj1rNcxOwLH+ZTDysF76MjOPbBHOe49nDHS4m6dEzzRg==
X-Received: by 2002:a17:907:9812:b0:ae0:d7c7:97ee with SMTP id
	a640c23a62f3a-ae3501517b3mr215390466b.41.1751018263460; 
	Fri, 27 Jun 2025 02:57:43 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a640c23a62f3a-ae35363a149sm94561266b.9.2025.06.27.02.57.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Jun 2025 02:57:42 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: add missing kref_get in handle_write_conflicts
Date: Fri, 27 Jun 2025 11:57:28 +0200
Message-ID: <20250627095728.800688-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Lars Ellenberg <lars@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Sarah Newman <srn@prgmr.com>, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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

From: Sarah Newman <srn@prgmr.com>

With `two-primaries` enabled, DRBD tries to detect "concurrent" writes
and handle write conflicts, so that even if you write to the same sector
simultaneously on both nodes, they end up with the identical data once
the writes are completed.

In handling "superseeded" writes, we forgot a kref_get,
resulting in a premature drbd_destroy_device and use after free,
and further to kernel crashes with symptoms.

Relevance: No one should use DRBD as a random data generator, and apparently
all users of "two-primaries" handle concurrent writes correctly on layer up.
That is cluster file systems use some distributed lock manager,
and live migration in virtualization environments stops writes on one node
before starting writes on the other node.

Which means that other than for "test cases",
this code path is never taken in real life.

FYI, in DRBD 9, things are handled differently nowadays.  We still detect
"write conflicts", but no longer try to be smart about them.
We decided to disconnect hard instead: upper layers must not submit concurrent
writes. If they do, that's their fault.

Signed-off-by: Sarah Newman <srn@prgmr.com>
Signed-off-by: Lars Ellenberg <lars@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_receiver.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e5a2e5f7887b..975024cf03c5 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2500,7 +2500,11 @@ static int handle_write_conflicts(struct drbd_device *device,
 			peer_req->w.cb = superseded ? e_send_superseded :
 						   e_send_retry_write;
 			list_add_tail(&peer_req->w.list, &device->done_ee);
-			queue_work(connection->ack_sender, &peer_req->peer_device->send_acks_work);
+			/* put is in drbd_send_acks_wf() */
+			kref_get(&device->kref);
+			if (!queue_work(connection->ack_sender,
+					&peer_req->peer_device->send_acks_work))
+				kref_put(&device->kref, drbd_destroy_device);
 
 			err = -ENOENT;
 			goto out;

base-commit: 456ef6804f232f3b2f60147046e05500147b0099
-- 
2.49.0

