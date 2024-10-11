Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A857F99A98D
	for <lists+drbd-dev@lfdr.de>; Fri, 11 Oct 2024 19:12:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 930DA420304;
	Fri, 11 Oct 2024 19:12:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 82662420304
	for <drbd-dev@lists.linbit.com>; Fri, 11 Oct 2024 19:11:50 +0200 (CEST)
Received: by mail-io1-f47.google.com with SMTP id
	ca18e2360f4ac-8354851fcabso98637839f.2
	for <drbd-dev@lists.linbit.com>; Fri, 11 Oct 2024 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728666709;
	x=1729271509; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Sek4vbxL3f/NlFo8Be6u5iyw5TmCpBli89Nh7BpIveQ=;
	b=KsIup9MrObT/ii63OMZ6/NA8/LSLNjUMpXjmi5Q5kIRE6GtHiihIMZyFKAehAXMSB0
	4F3/PhdYVgLUsxUA7CwmiMmy21mhTFmBQBA6ArLnaNKf6ffsCeQMVz9Gk/bbgxtuF/wU
	fLDAWRVu+EA9kIEy3jnX3kE30P4i86Rug8syLRjddlGFEy4n5MjybmvzzGuMsPOJaqB+
	tmwL0UKvuFeLKcQ4GlapjRT3DAjxxf74+uxktFpd7Wjwv4rCXTSWyV7ukNyZBmHX44kk
	JimdzmbqALGd8CTZgTx6Xbk3LI3hTUSrbkyOFgU4FDTZPO9Wtp67X7Yl0XDxJ2J9oo81
	Vgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1728666709; x=1729271509;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Sek4vbxL3f/NlFo8Be6u5iyw5TmCpBli89Nh7BpIveQ=;
	b=n3BBQryaSFH/1pf/oov+BJG7ggxxwg0zjWkX+W9EPFSGcH7UkHDolCP8gmociWnlqD
	rJxOrbVq68LYmnbUC4VkacbTHIPwKljVANCwKsUWvW/i03IV1w7eWlOriDrcT7AeKLln
	3o6DSe6Y+hnUD+W7UQYiboGNIaoFpxpc/us2hlHVg2qxLi/HokQPR7C8EGUQZIMtvNMQ
	UsRxFSb8SdqFav+dJRjp1A//pRjsoNBPF1TJEUObymzPUAtqV3lkj6t5CIeLFozFuP4C
	IIgrwS8DIwBE8orfAMPmsBYMwyItuY7RiHIt1bmD9HlpS8L0zC7nukZncpR1NNCiy2tY
	XicA==
X-Gm-Message-State: AOJu0Yz7S1cR/wYWtiiBqQWNSWgCY6xrTCM3KYdhQ9LB9dH/MQhM65no
	aYm1BM5nZxQN89EWWhRk3YPYQcm1tpaVstLnlhH3L9FpEnlSB/fzhrTTGCB4vpc=
X-Google-Smtp-Source: AGHT+IFuLm7s+TM3bvNQuo9LBJxVCafKSGcTPgBInu3ziFlc6P2leOeLbuC8vpArWI2WY/La7CZstQ==
X-Received: by 2002:a05:6602:6d06:b0:803:5e55:ecb2 with SMTP id
	ca18e2360f4ac-8378f64c49dmr450291539f.0.1728666709101; 
	Fri, 11 Oct 2024 10:11:49 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	8926c6da1cb9f-4dbada846dcsm713654173.89.2024.10.11.10.11.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2024 10:11:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, linux@treblig.org
In-Reply-To: <20241010204426.277535-1-linux@treblig.org>
References: <20241010204426.277535-1-linux@treblig.org>
Subject: Re: [PATCH] drbd: Remove unused conn_lowest_minor
Message-Id: <172866670811.255755.445033429638947954.b4-ty@kernel.dk>
Date: Fri, 11 Oct 2024 11:11:48 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
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


On Thu, 10 Oct 2024 21:44:26 +0100, linux@treblig.org wrote:
> conn_lowest_minor() last use was removed by 2011 commit
> 69a227731a37 ("drbd: Pass a peer device to a number of fuctions")
> 
> Remove it.
> 
> 

Applied, thanks!

[1/1] drbd: Remove unused conn_lowest_minor
      commit: 1e3fc2000035ffea0b1b7ec2423706715ab2e7f6

Best regards,
-- 
Jens Axboe



