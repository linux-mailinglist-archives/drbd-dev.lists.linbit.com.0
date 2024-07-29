Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EFC93F6C1
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jul 2024 15:34:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 464BC4204B5;
	Mon, 29 Jul 2024 15:34:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 758B042030C
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 15:34:26 +0200 (CEST)
Received: by mail-lj1-f181.google.com with SMTP id
	38308e7fff4ca-2ef2fccca2cso43116421fa.1
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1722260066; x=1722864866; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=XrfGcNac9J5y7SedVMOmkgIRNTomm1DD8h4AzlUUmg8=;
	b=hBAteLiG6yS4/Gtq/CzNiKF9yEfMRKR5r9QuW6SCAlx8J9YwYx2vmH7HvJTiceE9S2
	Xj8HPV+lsnJ58rPs6utjsddkqNaFQndbFskesXwAsEp+t3EOsz/WJFPHi6zzukedEzwr
	GdqsXZbkE70v5trnLMeZc4ggqCduPiOojydensSRBaXr3AOl5nz1KVrYS/zx6afzgTKt
	8LTGMXNx4P+vFHNjoQqarPwRb0glSYWD8PKX+0eY8YwR8rP9/6Krn7ME3AXwSr+Nd+oc
	RCc/I/uUX1BlXpoGWqBp+ctrFvxWlefteKZLO/nnskqJLKy2OSnusbIHGGTSOZPR/AjU
	Rqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1722260066; x=1722864866;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=XrfGcNac9J5y7SedVMOmkgIRNTomm1DD8h4AzlUUmg8=;
	b=RlM5TcLn0u+fpNvpyww9lJ6Dad+vdXf0xoDBIs0+ExKAJc1yaky8B/UKtt79RFpvbf
	zhFjY4JNZ0zvYZlnU7zuRN2XzFd7vz5kx61NXw936lhv8GvN7eU1xN7zh8j9gIxMCiL5
	cjlvw3w/ieb484+c+Xv3iX1HgRbyxplXdLE7qpPYYfbwMah424GhMaJClQ7AWyky/Zv6
	YDguQLPUQuc+gTxE3FJp3qu0+gJqU0eykiLvkTQ/SNyWMgNy3EtMvUg4q/BFBQ0FB+Ne
	4djIlMbBtq0byPqElrGP+w3JDQQfEZAtLXb5nIKcURexbZPfXYPV6tbahGrJKscTiZnc
	akaQ==
X-Gm-Message-State: AOJu0Yy9NtCmndeUrUBG5uTh6EayKTwk1Row9KdjihWgLJ78Fk1zaSBS
	EuyuGsp67yiQyfwul4QxDe36pZjfiKiQGf7NnQNls3sCl5E4+g4hbfkLwAMFHlMN1rblMFbYOdV
	n
X-Google-Smtp-Source: AGHT+IE7xPT+UjaZBapQKKIZ4djFrYtgrO466gma6bHJI4+NjpLzAP8TXj6er2aUqbM07HS8sy42tA==
X-Received: by 2002:a2e:a412:0:b0:2ef:2d3a:e70a with SMTP id
	38308e7fff4ca-2f12ee05a17mr47331191fa.18.1722260065879; 
	Mon, 29 Jul 2024 06:34:25 -0700 (PDT)
Received: from localhost.localdomain ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-70ead71832csm6802427b3a.72.2024.07.29.06.34.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jul 2024 06:34:25 -0700 (PDT)
From: Su Yue <glass.su@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [RFC PATCH 0/3] drbd.ocf support for OCF 1.1 standard
Date: Mon, 29 Jul 2024 21:34:07 +0800
Message-ID: <20240729133410.8332-1-glass.su@suse.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lars.ellenberg@linbit.com
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

Hi, drbd maintainers
Here is a patchset which adds supports of drbd.ocf for OCF 1.1 standard.
The motivation is that SUSE's SLE16 will bring corosync3 and pacemaker
built without option '--enable-compat-2.0'. So drbd.ocf needs some
adaptations.

The first two patches are compatible with pacemaker even without option
"--enable-compat-2.0".
NOTE: The third patch changes roles "Master" "Slave" to "Promoted" "Unpromoted".
It breaks the compatibility of Pacemaker < 2.1.0.

The patchset was tested in my testbox only, non SUSE QE. I want to get your
suggestions first so make it RFC. Many thanks.


Su Yue (3):
  drbd.ocf: replace crm_master with ocf_promotion_score
  drbd.ocf: update regex of sed for new output from crm_resource
  drbd.ocf: update for OCF 1.1

 scripts/drbd.ocf | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

-- 
2.45.2

