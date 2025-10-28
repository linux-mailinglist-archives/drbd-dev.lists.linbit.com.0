Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A1C12C43
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Oct 2025 04:31:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 85E6A162770;
	Tue, 28 Oct 2025 04:31:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7116716090D
	for <drbd-dev@lists.linbit.com>; Tue, 28 Oct 2025 04:31:22 +0100 (CET)
Received: by mail-pl1-f173.google.com with SMTP id
	d9443c01a7336-29476dc9860so41562165ad.0
	for <drbd-dev@lists.linbit.com>; Mon, 27 Oct 2025 20:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1761622281; x=1762227081;
	darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=/WJvY11yZe5DNuh0SmLl84KhyrfL2n7Y6FVCkvFsiMg=;
	b=F5V7/dvem4ASVCLd1ctP5PJPVEQ/4W4WTdVLTbHJqO6My4oU7+xHOsv2rGijsqVrXe
	YwT6KE4KJvbOna69PVfQPw18I/KNUgghAc2kGx9GQ23lgbO4fx+XqwU88zzAxnlodko5
	YqagJD+VZeESksAlMrxEOkmxtzHUDRjH+lt84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1761622281; x=1762227081;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=/WJvY11yZe5DNuh0SmLl84KhyrfL2n7Y6FVCkvFsiMg=;
	b=FT2oQNAHQkI16a4XLYYKzOgqcbnaYhVvESvVvy7NHpls1BAaSOefrLdRiwmULJzpPK
	HWAIviQ86kYqZhjb4B1ax8Kvw0F2siVMV+YiXH18b+thDMc8ghWHM+qDjDeA4t6AVNQo
	zX8ovrmpNUcYlNBQ3btCtIY8ICXQzRxkwxrQ835wq/YjEkSTi75JV6RIb1jgveX7wHbJ
	JWfBFMNJCvMHIakr9iYNiiHCHttv+sgw6q0mYv/XBVycfOuaFLKWKG9Cr5Z3qELvKQU2
	VmkbrB6Dtt1p9UfGJrSkEjwj8C2PRUr8D259T0qpnvnMUFrbKLKUmmlscDtm3UVwoT4+
	IiFw==
X-Forwarded-Encrypted: i=1;
	AJvYcCVtL7fKr/i0Vi16TKo60vjhq9DiI1pU2cbPpCi+0fVZwivsck5csmg5aA0vEFLZ5T8flhSNTRom4A==@lists.linbit.com
X-Gm-Message-State: AOJu0Ywc7Di3+DLK1LNeY3vGJCrfeBFBpgShCsDvvYfXXMwiK44PFPLn
	NmAUrp/JgUwfJ0LRFnst3OHdEdyXyWJth3mMIkjJN5P3sSyNgk1zv/hdQ8WaTBwpBQ==
X-Gm-Gg: ASbGncuKglayw2eTDWNwFNSBFdbRBp9u0ZvClbEf/E55VbRbnweAwHuwhSER3IzCFfN
	NvsozbGk6/A22WMCE/fXrh8sJgZeNkkE30/2XU/vU9l1wZ3TF9a/Fd2hLAPdh+9QJYEMrxZ/mWG
	4cW+RlLWLLnUgAL1kT/4++V798ErEbivyQIYC2IWYyEmnJAstHbjot/INzXyruxwRBb9HKrLl8o
	4UKQ173oUYoMglng07ACuaONwZNoP7naGk1Jyi9pNzqrQ8YDOjYkQCbIgpiDN2NBQaogGHBvfY5
	07A5TgVuUkcV68VsQnYB0ny03V1/apnGPOZ3V0TILB5oCwUZegRdvw7h8f2HagrAPMD/1hsUuRe
	/9Q9MMw05fKgAZ6SpdlNdIbVAj8z3GnQzR9I6HSeMsqaimpnb/hGx8BwK+UoOvOzCYcKlP0i0Th
	DrEjMm
X-Google-Smtp-Source: AGHT+IG4vfR0LE0WG8LCYJmEN31gkl7hCsYmhmgxpsNHn1XBOsYb/cbkA/Iv5cZPqQ3IQLRXV2PyoQ==
X-Received: by 2002:a17:902:dacd:b0:290:af0e:1183 with SMTP id
	d9443c01a7336-294cb6746c8mr22090685ad.51.1761622280960; 
	Mon, 27 Oct 2025 20:31:20 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:2c65:61c5:8aa8:4b47])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-29498cf4a53sm100342125ad.6.2025.10.27.20.31.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Oct 2025 20:31:20 -0700 (PDT)
Date: Tue, 28 Oct 2025 12:31:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
Message-ID: <4tqwviq3dmz2536eahhxxw6nj24tbg5am57yybgmmwcf4vtwdn@s7f4n2yfszbe>
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
	<CAKEwX=MqsyWki+DfzePb3SwXWTZ_2tcDV-ONBQu62=otnBXCiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=MqsyWki+DfzePb3SwXWTZ_2tcDV-ONBQu62=otnBXCiQ@mail.gmail.com>
Cc: muchun.song@linux.dev, linux-doc@vger.kernel.org, roman.gushchin@linux.dev,
	mhocko@kernel.org, linux-mm@kvack.org, shakeel.butt@linux.dev,
	drbd-dev@lists.linbit.com, corbet@lwn.net,
	YoungJun Park <youngjun.park@lge.com>,
	jinji zhong <jinji.z.zhong@gmail.com>, senozhatsky@chromium.org,
	linux-block@vger.kernel.org, terrelln@fb.com, dsterba@suse.com,
	cgroups@vger.kernel.org, akpm@linux-foundation.org,
	axboe@kernel.dk, feng.han@honor.com, liulu.liu@honor.com,
	minchan@kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, mkoutny@suse.com,
	hannes@cmpxchg.org, tj@kernel.org, zhongjinji@honor.com,
	lars.ellenberg@linbit.com
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

On (25/10/27 15:46), Nhat Pham wrote:
> Another alternative is to make this zram-internal, i.e add knobs to
> zram sysfs, or extend the recomp parameter. I'll defer to zram
> maintainers and users to comment on this :)

I think this cannot be purely zram-internal, we'd need some "hint"
from upper layers which process/cgroup each particular page belongs
to and what's its priority.
