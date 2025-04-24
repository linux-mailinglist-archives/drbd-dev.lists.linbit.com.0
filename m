Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 315EFAA4221
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Apr 2025 07:11:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E0D216B828;
	Wed, 30 Apr 2025 07:11:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
	[209.85.219.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BEE4E16091D
	for <drbd-dev@lists.linbit.com>; Thu, 24 Apr 2025 17:23:04 +0200 (CEST)
Received: by mail-yb1-f170.google.com with SMTP id
	3f1490d57ef6-e455bf1f4d3so945138276.2
	for <drbd-dev@lists.linbit.com>; Thu, 24 Apr 2025 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1745508183; x=1746112983;
	darn=lists.linbit.com; 
	h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
	:date:message-id:reply-to;
	bh=9AAmEBZDITOHGWG7YsyD6vnkUx3rjCkhM++uA9RUsgY=;
	b=e/MXplBin1SPo6TJCk49t98ajGxDcPK0HRoG9AlpvG3VF2PvWKhoowc6TIEmzgdKIY
	507yIjQyqb/2IMhWcPl1qSldzphZYeTWMvvtf4Q6w4tg/WQ4+5OXeKu3HBDElor64Dos
	6hgfX6jdnH0mCbhlRMdI25CJakVbKEw7/YjxoRG/lEnMrz2XTS+I8UV6/qq27Vi/RrKp
	iAv5Ynx5mpsfNORSPIOazRnhMHZSjZ5hb9jfLhQ5ua16AW+3JshBTOumgPS/HB0XZojH
	JaTNYEe7wffsE3MD8FjcVv1DfnB29r8/QN+P2U4WzdkCSmG5GaAoAXJpymmgVT9nWYbZ
	Eq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1745508183; x=1746112983;
	h=to:subject:message-id:date:from:mime-version:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=9AAmEBZDITOHGWG7YsyD6vnkUx3rjCkhM++uA9RUsgY=;
	b=Yy6A5eNLV7EjnJWRupsJ/hGM8dD+4xIEd6owHzQp4XBgdGBsjN8SE2cpirsJz7STR4
	vKhIEwlO3utIcspAkHinM1/h/2NgYXFDrvRDP1QPdBT9kpFPxjUNjy875kVWlPYg0wzY
	tHv8GtIgWOltufWqQp0EDQLyxCxhDoll0M90VEHTfy5v/TKjA+UdLq8a3aSSpoEQAUzC
	iPTFzv2zQP5Dn8KJMw1a0QJfUvV8TsH8YGdxUZRgwX3472SBVcBKD8Y/yxnKJs/Hgd46
	Hew0eavBE6/EnBRhX/rPk6Vlms5MtmFty+Kj7vOONWeeEMN8XKapgsyiGGkhAv203++0
	1Wkw==
X-Gm-Message-State: AOJu0YxT6YvjGsxtrdVY62A9AY7be+hHf5fnp6oxfQG7104r7bVeBRtC
	6d4ty6WE5NFfNNPc49BrMXj2ul4ZNV+tuSQrlFHbw1dccgAlQP6ht395go5XCneytNPnFvPqWXO
	DnU5sPHL+gnUfQnFotsxIMSN6TLJpCO9P
X-Gm-Gg: ASbGncv9F9blfsZu9YbOuCpv2lN81+vEVLDlLp25G/tXg9Y91u2cwWFgOVhSAUF6xS5
	4oOq/E/4tJ8DUJeBtZTvlpaiOAX1ugnGYSYzFnO6MbLuEcBWcJL3vbtceYW7qDHlDIjy8qBVrwb
	RIAGDtaE+jDwfF+q03mNd9zQ==
X-Google-Smtp-Source: AGHT+IG4pI2kejp6F9CrmQa4Sco5ySicQOVCppNFIBy6E7HqVsCRQDewpZkmE0Wk7G+iV9ezsCGLnjHyrVmpD5MVjRY=
X-Received: by 2002:a05:6902:2186:b0:e6d:f6db:1938 with SMTP id
	3f1490d57ef6-e730353d0eamr4047545276.6.1745508183336; Thu, 24 Apr 2025
	08:23:03 -0700 (PDT)
MIME-Version: 1.0
From: Reginald Cirque <splc.regional.east@gmail.com>
Date: Thu, 24 Apr 2025 11:22:52 -0400
X-Gm-Features: ATxdqUFHxwKTxiEZthEy6KTVQrmLKq9zohgN65aFINn9RXIopRnIPKgNWuVVlWQ
Message-ID: <CANA-72DMWg-UwGBVbM9y-p9zUJu_4LqZk3V9qOEZCM0nSHzq=Q@mail.gmail.com>
Subject: Possible memory leak in DRBD 8.4.11
To: drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Apr 2025 07:11:07 +0200
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

Good day,
I was syncing a 300 GB LVM volume from a DRBD primary to a newly-built
secondary, and noticed that the sending host (primary) had 300G of
"untracked", used, memory (not visible in slab, cached, or associated
with any application(s), simply shown as "kernel dynamic memory" in
"smem -twk" output) for long (many hours) after the sync had
completed, suggesting that DRBD buffers/page-pool were not reclaimed.

When I ran "drbdsetup down" to disconnect the secondary, I observed a
kernel log message:
"block drbd3: net_ee not empty, killed 291226 entries", which further
suggests to me that DRBD buffers are not being properly reclaimed.

The memory was returned back to the system ~instantly after
disconnecting the secondary.

I am running Linux kernel 6.1.128-1.el8.x86_64 and patching-in the
8.4.11 DRBD module in-tree.
