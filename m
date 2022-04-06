Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F604F5737
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 10:07:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C2539420FC6;
	Wed,  6 Apr 2022 10:07:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C77DC420FB2
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 10:07:16 +0200 (CEST)
Received: by mail-ej1-f49.google.com with SMTP id bh17so2561334ejb.8
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:content-language:to:cc:from
	:subject:content-transfer-encoding;
	bh=BK4uqR4DBxUcrOhSL0+7lH+xVrswMnPHtjVKXsOOpG4=;
	b=BsP+slwiGpMkPf/dgipgLte79LcScL1Bzneuo/X2T+L007SVcLKYhH4WnFDdQ4Hh11
	WUEoJUDeg/oK0y0FBgvqq+apORk9ZUEaRWyk9/4SI0EjyCBMgtW/pj+No3We4coZO1d9
	qHb5/czAauAt+P9dJDEiclfZ9AWovvrhH4HsCMoeQTOE3YQplNukr+bpn/hznfo+MABb
	WcTwf/H0bGyy35GYN/Oky7AuU86mtCuqrJhCF4scvj00IZBUvT//nrIQlwarhyq6aBdL
	CY68PBMn2TV5I34+ibPnOioCwy+udy6ngNkMrk2+Ss4xPpk4Y5FHoLmiuvBQvRXLXEfh
	06Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent
	:content-language:to:cc:from:subject:content-transfer-encoding;
	bh=BK4uqR4DBxUcrOhSL0+7lH+xVrswMnPHtjVKXsOOpG4=;
	b=WXANiVbSeceSb89NHc5e0Fqvl3P9TMAJcZAmBPSY8qBhrp+P0B4MDyg97VJM91Y8/+
	oSttm+K6g/3iEgeX1QQxzQI1iihJv2JUGHl0kEgEUsD7nZNUiIOEOzhckmDzBRtP3jSq
	jb2wlFsIEgUdhuJg/n7H8ny3FlS9QoOJrKOHgFUVO2BkisEfTcUfqmCmTqzqjxBpTKW4
	247RtjpM9hQXvZ/doOyKU6WACA0hem5XUajq6fucSIvI7VB94OH8sptwXYlhbREtkVXr
	Q7wG6KXT92g+V/zxKkiEoxU7BUfoYj4V6PWUKHI5s4VRKQC8Kn+AKzw32DWQkPYpFqno
	hT1Q==
X-Gm-Message-State: AOAM531wBUbtUr/FZQwyA8YWdeOUV+uiAiiJ3GDyjyWH0hyyuOd3+faa
	RrwMUo4o8Tp28rqWMQPqw2hW2svedOFO/KQhoR0=
X-Google-Smtp-Source: ABdhPJwJX6r3yfeEYEn95I6lOIn41Oq/clijjnflZWOXHkxNbce8Drfed0p6O52HauE7LjeAPl0L2Q==
X-Received: by 2002:a17:906:6a11:b0:6e4:976b:e94 with SMTP id
	qw17-20020a1709066a1100b006e4976b0e94mr7316685ejc.142.1649232436324;
	Wed, 06 Apr 2022 01:07:16 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	do8-20020a170906c10800b006dfe4d1edc6sm6246817ejc.61.2022.04.06.01.07.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 01:07:15 -0700 (PDT)
Message-ID: <bca64395-2c73-25f9-dbca-76479ef5d280@linbit.com>
Date: Wed, 6 Apr 2022 10:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [GIT PULL] DRBD updates for Linux 5.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Jens,

these updates are mostly cosmetic; also stuff we missed over the years.

Please pull for 5.19.


The following changes since commit ff0f3f83175274daf2eb4fd4db6430ab71c66e80:

  Merge branch 'for-5.19/io_uring-xattr' into for-next (2022-04-04 17:59:51 -0600)

are available in the Git repository at:

  https://github.com/LINBIT/linux-drbd.git tags/drbd-5.19-2022-04-06

for you to fetch changes up to 7e4d200ceb13f404ab4f9332c81abb2c260eeff9:

  drbd: Return true/false (not 1/0) from bool functions (2022-04-06 09:06:27 +0200)

----------------------------------------------------------------
Miscellaneous DRBD updates for Linux 5.19

- return true/false instead of 1/0 from bool functions (Haowen Bai)
- use kvfree_rcu instead of synchronize_rcu() followed by kvfree()
  (Haowen Bai)
- prefer "unsigned int" over "unsigned" (Cai Huoqing)
- use the PFN_UP helper macro (Cai Huoqing)
- remove a redundant assignment (Jiapeng Chong)
- fix type mismatches for netlink return codes (Arnd Bergmann)
- fix array initializers for cmdnames (Arnd Bergmann)

----------------------------------------------------------------
Arnd Bergmann (2):
      drbd: fix duplicate array initializer
      drbd: address enum mismatch warnings

Cai Huoqing (2):
      drbd: Make use of PFN_UP helper macro
      drbd: Replace "unsigned" with "unsigned int"

Haowen Bai (1):
      drbd: Return true/false (not 1/0) from bool functions

Jiapeng Chong (1):
      block: drbd: drbd_receiver: Remove redundant assignment to err

Uladzislau Rezki (Sony) (1):
      drdb: Switch to kvfree_rcu() API

 drivers/block/drbd/drbd_bitmap.c   |  2 +-
 drivers/block/drbd/drbd_main.c     | 11 ++++++-----
 drivers/block/drbd/drbd_nl.c       | 33 ++++++++++++++++-----------------
 drivers/block/drbd/drbd_receiver.c | 15 ++++++---------
 drivers/block/drbd/drbd_req.c      |  2 +-
 drivers/block/drbd/drbd_state.c    |  3 +--
 drivers/block/drbd/drbd_worker.c   |  2 +-
 7 files changed, 32 insertions(+), 36 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
