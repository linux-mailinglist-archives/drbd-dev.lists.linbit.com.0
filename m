Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2F873840
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 15:04:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 421EB4205C9;
	Wed,  6 Mar 2024 15:04:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B4CD42035F
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 15:04:14 +0100 (CET)
Received: by mail-ed1-f52.google.com with SMTP id
	4fb4d7f45d1cf-564fd9eea75so2643229a12.3
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709733854;
	x=1710338654; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=/+YBoOXcmEaodcQB2eW9zOPeevzURByDqXAI9NhYKMc=;
	b=U01J4DtIrHJ7zfHI/p62QkyX38t5WcjV5bs2OYR43vSHYST9LMIkeLCxJBXNdsKKKh
	tJhkdk3l0xBERbJf+Kg+Rz7l7kztKAclhroIctS+huBA3Q8lI91wniriQjzzAosuL1Kt
	DTXwKqXIv3ORXSFhXNUUtU50RE+X/RJw13XwxM2z/0JsE4GpkI0JP5fFNYhUqR6P/57k
	SeGIPRU7DT1szLRIVNUHtKyRGOgx2amiTVcwgd/84WR/Urr8y+KGB2Nkn7IxvHXnA5PG
	jFPOFHpOFFmyp0HOg1UK+rsboQMQnCup59FOr2xgZAN6Y4fGIICB8UQhm3XUS5i0OHuK
	Ld9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709733854; x=1710338654;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=/+YBoOXcmEaodcQB2eW9zOPeevzURByDqXAI9NhYKMc=;
	b=BzdhUmAZSqcnvT/tODU/GTeYubexFiMp1ZHOkHldyHpBUmp/4RBJjyN2IeEHu99tz2
	XJ9BA6Xg9JG2l1DDXSJigO4kottO4bRFPStOFa/YoAiKBt1ek3SJC7URFMyBLSOdz5s4
	/GjHZzWMT6WBFGDBSCIkW5s7kjDNkJwnHI1KYqIhmw0aRtAQDhwOcyGldWWMS9AaJS6Y
	6iGs8xErkxiS0MimxmPv4Ym6EWzzWlB20hL+1DrEIypC55iBAFAVMZ+vr144qwKjgve/
	AQPgWfbAwvoXAe+z/uVx9YXsMiaswdjj9dHHH1pdCXnocl9tx7B56oyLrQit0VXgZf6m
	YWfA==
X-Gm-Message-State: AOJu0YxvEsmqtYlT1PO9G3VFkyeblMEhfuYOY9oiuc5nuSK0nBiYuN82
	SY+wy2aCNvUe4NkcOBGxu2RNgoX+Rua8qokZUqfskdcWyZuBqbtWGScWkd5jEIvN6A==
X-Google-Smtp-Source: AGHT+IFqTbA1RssQ9CLqFuQ0Vl0lw5IbmtZKf3aPPx9rduNbs8A5uIcf+/fvfGwBCbjm5RD3JH1pjw==
X-Received: by 2002:aa7:d714:0:b0:567:48b9:e9e6 with SMTP id
	t20-20020aa7d714000000b0056748b9e9e6mr5920495edq.42.1709733854315;
	Wed, 06 Mar 2024 06:04:14 -0800 (PST)
Received: from ryzen9.home (62-47-18-60.adsl.highway.telekom.at. [62.47.18.60])
	by smtp.gmail.com with ESMTPSA id
	m18-20020aa7c492000000b005662d3418dfsm6924991edq.74.2024.03.06.06.04.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 06:04:13 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 0/7] drbd atomic queue limits conversion
Date: Wed,  6 Mar 2024 15:03:25 +0100
Message-Id: <20240306140332.623759-1-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240305134041.137006-1-hch@lst.de>
References: <20240305134041.137006-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-block@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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

Hello Jens,

Here, with the Reviewed-by and Tested-by trailers.

Christoph Hellwig (7):
  drbd: pass the max_hw_sectors limit to blk_alloc_disk
  drbd: refactor drbd_reconsider_queue_parameters
  drbd: refactor the backing dev max_segments calculation
  drbd: merge drbd_setup_queue_param into
    drbd_reconsider_queue_parameters
  drbd: don't set max_write_zeroes_sectors in decide_on_discard_support
  drbd: split out a drbd_discard_supported helper
  drbd: atomically update queue limits in
    drbd_reconsider_queue_parameters

 drivers/block/drbd/drbd_main.c |  13 +-
 drivers/block/drbd/drbd_nl.c   | 210 ++++++++++++++++-----------------
 2 files changed, 110 insertions(+), 113 deletions(-)

-- 
2.40.1

