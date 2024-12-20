Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F6A1668A
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jan 2025 07:11:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC07F16B80D;
	Mon, 20 Jan 2025 07:11:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 154DD16096A
	for <drbd-dev@lists.linbit.com>; Fri, 20 Dec 2024 18:27:38 +0100 (CET)
Received: by mail-wr1-f54.google.com with SMTP id
	ffacd0b85a97d-3862b364538so1264378f8f.1
	for <drbd-dev@lists.linbit.com>; Fri, 20 Dec 2024 09:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro.org; s=google; t=1734715658; x=1735320458;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
	b=IcIjKDcsG2WLv4/uB+K5H/XKnt/zjwoHbnoSkPcqQz1/7J4j+vZ75M+LTJslmBtK6j
	LI4iT82grRUsyCcsLI/bCHH0fo2OHLSzGrzrHhv+dWef6ChZ4u8iJhBoeu96Ur/44j/g
	3EqZcoaEJerEpmQ3UvQeiP0rOpFtpahK0PkLCOdPEswl4c1xzGvkwT1S+yfEn9+vtzqz
	6TtNUGFk2CYlgVm2f37SbUS/W0dFeAZ0NdArXNN9TFpI61MdNaqovdOGVZDiuF0EbITP
	5yW84sPJxzYECvwhGudZ8pYlz398skRLXWZDLXKpbnsz9aYUN99hsleXQj9fO0yjdq10
	gSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1734715658; x=1735320458;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
	b=BQoJuUvgqf84jkKq0y2J/cC3LT7GZfWwspw5K404FQjCSk4IrEaWHGsOnuwEBwgpa6
	J6vrT1TRByCXZCCpm8lslNBRkrjYlERgo4ng05gaQ1hOd8oj6RSgNHHv5IclaeJIZql+
	mpTNANmPo1+h9GpYdB0c+59pDD1fhL0R/pXYVyP8y7yjPsGNy5/EgwLN0Ym3zjmCcEwa
	VMaS+ulQbS+y5dgr95f/lWtPUPKMmMuKykKP5JkrdxlDDI6Y3Q2WEsghX1CsWUegFhrA
	zoa7Fhzd8ia8vqkXk7mKJisyYntDTuyNbcsZNsZfEBLusCp8J+VODFxMk2BtXDDy+PYt
	FBAw==
X-Forwarded-Encrypted: i=1;
	AJvYcCUb9HMA7KbQHMGcWO2mFAeRci3xLIdONbNcpwNDfE0kZGEYxa4CDNIsHxbPXR1tf/dInjf30KPhhw==@lists.linbit.com
X-Gm-Message-State: AOJu0YyXr+2wF66f30ycLRcsvrANOJsdnP1zSNYyVXn/TG71gk6ZwnAg
	84WZ+cJYN6ITNGXPsTtQE+4IvgzzWiYXlVAJhsc5+7L6Ch7EELB3xCfhO6Viec0=
X-Gm-Gg: ASbGncuMYz1a+YTpHGvYldgEzV5efDk+0fWAS71tTiz+jipp0qOnS3cO0Q6W5h1DtkI
	0x+C02d/gHy8UhROqY4mmR8EnjG6SQZLX/SGSsg1Q+58is3VxjstjD2iFHiw4PVOklDwCrIWG1/
	xhEL2Fyoo2nOVoNvS4fn+PFrLOqeqC35iRfwcWtfusPNpEq2JSd3rsWWVQ8mLEGwQnmd7Oy2J5b
	8zNPjiXOxvEBSnpMiCZ2lv9cJEsalK+vT+Va7AKEUG0+Q1vkUGDv6O0Tgx/vUy55DKF7hQ6tnM=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id
	ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179; 
	Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Mailman-Approved-At: Mon, 20 Jan 2025 07:11:04 +0100
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org,
	Jan Kara <jack@suse.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Neil Brown <neilb@suse.de>, linux-pci@vger.kernel.org,
	kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	dccp@vger.kernel.org, Dai Ngo <Dai.Ngo@oracle.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	iommu@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
	Robin Murphy <robin.murphy@arm.com>,
	Olga Kornievskaia <okorniev@redhat.com>,
	linux-arm-msm@vger.kernel.org, Naveen N Rao <naveen@kernel.org>,
	linux-sound@vger.kernel.org, maple-tree@lists.infradead.org,
	Tom Talpey <tom@talpey.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	audit@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

